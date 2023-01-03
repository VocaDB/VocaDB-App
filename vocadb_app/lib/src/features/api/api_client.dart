import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:vocadb_app/flavor_config.dart';

class ApiClient {
  ApiClient({required this.host, required this.client});
  final String host;

  final http.Client client;

  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? params,
    bool json = true,
  }) async {
    var uriQueryParameters =
        params?.map((key, value) => MapEntry(key, value.toString()));
    final uri = Uri.https(host, endpoint, uriQueryParameters);
    final response = await client.get(uri);

    if (response.ok) {
      return (json) ? jsonDecode(response.body) : response.body;
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
final apiClientProvider = Provider<ApiClient>((ref) {
  final client = http.Client();
  final config = ref.read(flavorConfigProvider);

  ref.onDispose(() {
    client.close();
  });

  return ApiClient(host: config.apiAuthority, client: client);
});
