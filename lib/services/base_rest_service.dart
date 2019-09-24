import 'dart:async';

import 'package:vocadb/models/base_model.dart';
import 'package:vocadb/services/web_service.dart';

abstract class BaseRestService<T extends BaseModel> {

  String endpoint;

  RestService restService;

  BaseRestService(this.restService);

  T mapModel(Map json);

  Future<List<T>> query(String query, Map params) async {
    return restService.get(endpoint, params)
    .then((v) => v['items'] as Iterable)
    .then((items) => items.map((_) => mapModel(_)).toList());
  }
}