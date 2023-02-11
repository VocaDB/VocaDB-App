import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/exceptions/require_login_exception.dart';
import 'package:vocadb_app/src/features/api/api_cache.dart';
import 'package:vocadb_app/src/features/api/data/cookie_storage.dart';
import 'package:vocadb_app/src/features/api/utils/cookie_reader.dart';

class ApiClient {
  ApiClient({
    required this.host,
    required this.client,
    required this.apiCache,
    required this.cookieStorage,
  });
  final String host;

  final http.Client client;
  final ApiCache apiCache;
  final CookieStorage cookieStorage;

  Future<String> fetchCookieToken() async {
    final uri = Uri.https(host, '/api/antiforgery/token');

    // Get token
    final response = await client.get(uri);

    // 204
    if (!response.ok) {
      throw HttpException('Failed to get token', uri: uri);
    }

    final cookie = response.headers['set-cookie'];

    if (cookie == null || cookie.isEmpty) {
      throw HttpException('set-cookie does not exists in response headers',
          uri: uri);
    }

    return cookie;
  }

  Future<dynamic> authGet(
    String endpoint, {
    Map<String, String>? params,
    bool json = true,
  }) async {
    final cookie = await cookieStorage.get();

    if (cookie.isEmpty) {
      throw RequireLoginException();
    }

    final uri = Uri.https(host, endpoint, params);

    final headers = {'Cookie': cookie, 'Content-Type': 'application/json'};

    print('[AUTH GET] ${uri.toString()}');

    final response = await client.get(uri, headers: headers);

    if (!response.ok) {
      throw HttpException(response.reasonPhrase ?? 'ApiClient error', uri: uri);
    }

    return (json) ? jsonDecode(response.body) : response.body;
  }

  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? params,
    bool json = true,
    bool cache = true,
    Map<String, String>? headers,
  }) async {
    var uriQueryParameters = params?.map((key, value) {
      if (value is List) {
        return MapEntry(key, value.map((e) => e.toString()).toList());
      }

      return MapEntry(key, value.toString());
    });
    final uri = Uri.https(host, endpoint, uriQueryParameters);

    if (cache) {
      String cacheBody = await apiCache.get(uri.toString());

      if (cacheBody.isNotEmpty) {
        print('[GET][CACHE] ${uri.toString()}');
        return (json) ? jsonDecode(cacheBody) : cacheBody;
      }
    }

    print('[GET] ${uri.toString()}');

    final response = await client.get(uri, headers: headers);

    if (!response.ok) {
      throw HttpException(response.reasonPhrase ?? 'ApiClient error', uri: uri);
    }

    if (cache) {
      await apiCache.put(uri.toString(), response.body);
    }

    return (json) ? jsonDecode(response.body) : response.body;
  }

  Future<http.Response> post(
    String endpoint, {
    Object? body,
  }) async {
    final cookie = await cookieStorage.get();

    if (cookie.isEmpty) {
      throw RequireLoginException();
    }
    final headers = {'Cookie': cookie, 'Content-Type': 'application/json'};
    final uri = Uri.https(host, endpoint);
    print('[POST] ${uri.toString()}');
    final response = await client.post(uri, body: body, headers: headers);

    if (response.ok) {
      return response;
    } else {
      throw HttpException(response.reasonPhrase ?? 'ApiClient error', uri: uri);
    }
  }

  Future<void> login(String username, String password) async {
    final cookie = await fetchCookieToken();

    final requestverificationtoken = CookieReader.read(cookie, 'XSRF-TOKEN');

    if (requestverificationtoken.isEmpty) {
      throw const HttpException('Cannot get XSRF-TOKEN from cookies');
    }

    // Login
    final loginUri = Uri.https(host, '/api/users/login');
    final loginBody = {
      'keepLoggedIn': true,
      'username': username,
      'password': password,
    };
    final loginHeaders = {
      'requestverificationtoken': requestverificationtoken,
      'Cookie': cookie,
      'Content-Type': 'application/json'
    };

    final loginResponse = await client.post(loginUri,
        body: jsonEncode(loginBody), headers: loginHeaders);

    if (!loginResponse.ok) {
      // TODO Replace generic logic
      throw HttpException('Username or password doesn\'t match', uri: loginUri);
    }

    await cookieStorage.save(loginResponse.headers['set-cookie'] ?? cookie);
  }

  Future<void> logout() async {
    final cookie = await fetchCookieToken();

    final requestverificationtoken = CookieReader.read(cookie, 'XSRF-TOKEN');

    if (requestverificationtoken.isEmpty) {
      throw const HttpException('Cannot get XSRF-TOKEN from cookies');
    }

    final logoutUri = Uri.https(host, '/api/users/logout');
    final logoutHeaders = {
      'requestverificationtoken': requestverificationtoken,
      'Cookie': cookie,
      'Content-Type': 'application/json'
    };

    final logoutResponse = await client.post(logoutUri, headers: logoutHeaders);

    if (!logoutResponse.ok) {
      // Log error
      print(
          'Failed to call logout with status code is ${logoutResponse.statusCode}');
    }
    await cookieStorage.clearAll();
  }
}

extension ResponseExtended on http.Response {
  bool get ok {
    return (statusCode ~/ 100) == 2;
  }
}

/// APIClient Provider
final apiClientProvider = Provider.autoDispose<ApiClient>((ref) {
  final client = http.Client();
  final apiCache = ref.watch(apiCacheProvider);
  final config = ref.read(flavorConfigProvider);
  final cookieStorage = ref.watch(cookieStorageProvider);

  return ApiClient(
    host: config.apiAuthority,
    client: client,
    apiCache: apiCache,
    cookieStorage: cookieStorage,
  );
});
