import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/features/api/api_cache.dart';

class ApiClient {
  ApiClient({required this.host, required this.client, required this.apiCache});
  final String host;

  final http.Client client;
  final ApiCache apiCache;

  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? params,
    bool json = true,
    bool cache = true,
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

    final response = await client.get(uri);

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
    final uri = Uri.https(host, endpoint);
    final response = await client.post(uri, body: body);

    if (response.ok) {
      return response;
    } else {
      throw HttpException(response.reasonPhrase ?? 'ApiClient error', uri: uri);
    }
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

  return ApiClient(
      host: config.apiAuthority, client: client, apiCache: apiCache);
});
