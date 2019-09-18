import 'dart:convert';

import 'package:vocadb/services/web_service.dart';

class TagModel {
  int id;
  String name;
  String categoryName;
  String additionalNames;
  String urlSlug;

  TagModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        categoryName = json['categoryName'],
        additionalNames = json['additionalNames'];

  static TagModel _mapObjectResponse(response) {
    final result = json.decode(response.body);
    return TagModel.fromJson(result);
  }

  static Resource<TagModel> byId(int id) {
    return Resource(endpoint: '/api/tags/$id', parse: _mapObjectResponse);
  }
}
