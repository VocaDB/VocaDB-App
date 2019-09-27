import 'dart:async';

import 'package:vocadb/services/web_service.dart';

class BaseRestService {
  RestApi restApi = RestApi();

  BaseRestService({RestApi restApi}) {
    this.restApi = restApi ?? RestApi();
  }

  Future<dynamic> query(String endpoint, Map<String, String> params) async {
    return restApi
        .get('$endpoint', params)
        .then((v) => (v is Iterable) ? v : v['items'] as Iterable);
  }

  Future<T> getObject<T>(String endpoint, Map<String, String> params) async {
    return restApi.get('$endpoint', params).then((v) => v as T);
  }
}
