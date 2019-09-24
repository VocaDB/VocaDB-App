import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

const host = 'https://vocadb.net';
final dio = Dio();

class Resource<T> {
  final String url;
  final String endpoint;
  final Map<String, dynamic> params;
  T Function(Response response) parse;

  Resource({this.url, this.endpoint, this.parse, this.params});
}

class WebService {
  Future<T> load<T>(Resource<T> resource) async {
    String actualUrl =
        (resource.url == null) ? host + resource.endpoint : resource.url;
    dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: host)).interceptor);

    final response = await dio.get(actualUrl,
        options: buildCacheOptions(Duration(minutes: 5)));
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}

class RestService {
  final String host = 'https://vocadb.net';
  final Dio dio = Dio();

  RestService() {
    dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: host)).interceptor);
  }

  Future<Map<String, dynamic>> get(
      String endpoint, Map<String, dynamic> params) async {
    final response = await dio.get<Map<String, dynamic>>(
        Uri.https(host, endpoint, params).toString(),
        options: buildCacheOptions(Duration(minutes: 5)));
    if (response.statusCode == 200) {
      return response.data;
    }

    throw Exception('Failed to load data!');
  }
}
