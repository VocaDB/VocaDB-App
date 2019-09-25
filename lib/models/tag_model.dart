import 'package:dio/dio.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/services/web_service.dart';

class TagModel extends EntryModel {
  EntryType entryType = EntryType.Tag;
  String categoryName;
  String additionalNames;
  String description;
  String urlSlug;

  TagModel.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        categoryName = json['categoryName'],
        urlSlug = json['urlSlug'],
        additionalNames = json['additionalNames'],
        super.fromJson(json);

  static List<TagModel> jsonToList(List items) {
    return items.map((i) => TagModel.fromJson(i)).toList();
  }

  static TagModel _mapObjectResponse(Response response) {
    final result = response.data;
    return TagModel.fromJson(result);
  }

  static Resource<TagModel> byId(int id) {
    return Resource(
        endpoint: '/api/tags/$id?fields=Description',
        parse: _mapObjectResponse);
  }

  get imageUrl => (mainPicture != null && mainPicture.urlThumb != null)
      ? mainPicture.urlThumb
      : null;
}
