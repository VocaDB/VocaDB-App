import 'dart:async';

import 'package:vocadb/services/web_service.dart';

abstract class BaseRestService extends RestService {

  Future<dynamic> query(String endpoint, Map<String, String> params) async {
    return super
        .get('$endpoint', params)
        .then((v) => (v is Iterable) ? v : v['items'] as Iterable);
  }

  Future<T> getObject<T>(String endpoint, Map<String, String> params) async {
    return super
        .get('$endpoint', params)
        .then((v) => v as T);
  }
}
