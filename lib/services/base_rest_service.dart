import 'dart:async';

import 'package:vocadb/models/base_model.dart';
import 'package:vocadb/services/web_service.dart';

abstract class BaseRestService<T extends BaseModel> {

  RestService restService;

  BaseRestService(this.restService);

  T mapModel(Map json);

  Future<List<T>> query<T>(String endpoint, Map<String, String> params) async {
    return restService
        .get('$endpoint', params)
        .then((v) => (v is Iterable)? v : v['items'] as Iterable)
        .then((items) => items.map((_) => mapModel(_) as T).toList());
  }
}
