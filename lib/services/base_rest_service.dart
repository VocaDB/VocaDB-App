import 'dart:async';

import 'package:vocadb/services/web_service.dart';

abstract class BaseRestService {
  RestApi restApi = RestApi();

  BaseRestService({this.restApi});

  Future<dynamic> query(String endpoint, Map<String, String> params) async {
    return restApi
        .get('$endpoint', params)
        .then((v) => (v is Iterable) ? v : v['items'] as Iterable);
  }

  Future<T> getObject<T>(String endpoint, Map<String, String> params) async {
    return restApi.get('$endpoint', params).then((v) => v as T);
  }
}
