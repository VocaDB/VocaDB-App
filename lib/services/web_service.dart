import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:vocadb/constants.dart';

const host = 'https://vocadb.net';
final dio = Dio();

class RestApi {
  final Dio dio = Dio();

  RestApi() {
    dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: host)).interceptor);
  }

  Future<dynamic> get(String endpoint, Map<String, String> params) async {
    String url = Uri.https(AUTHORITY, endpoint, params).toString();
    print(url);
    final response =
        await dio.get(url, options: buildCacheOptions(Duration(minutes: 5)));
    if (response.statusCode == 200) {
      return response.data;
    }

    throw Exception('Failed to load data!');
  }
}
