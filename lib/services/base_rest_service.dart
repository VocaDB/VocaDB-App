import 'dart:async';

import 'package:vocadb/services/web_service.dart';

abstract class BaseRestService {
  RestService restService;

  BaseRestService(this.restService);

  Future<dynamic> query(String endpoint, Map<String, String> params) async {
    return restService
        .get('$endpoint', params)
        .then((v) => (v is Iterable) ? v : v['items'] as Iterable);
  }
}
