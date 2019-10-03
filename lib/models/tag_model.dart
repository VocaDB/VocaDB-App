import 'package:dio/dio.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/services/web_service.dart';
import 'package:vocadb/utils/json_utils.dart';

class TagModel extends EntryModel {
  EntryType entryType = EntryType.Tag;
  String categoryName;
  String additionalNames;
  String description;
  String urlSlug;
  TagModel parent;
  List<TagModel> relatedTags;

  TagModel.fromJson(Map<String, dynamic> json)
      : parent = json.containsKey('parent')
            ? TagModel.fromJson(json['parent'])
            : null,
        description = json['description'],
        categoryName = json['categoryName'],
        urlSlug = json['urlSlug'],
        additionalNames = json['additionalNames'],
        relatedTags = JSONUtils.mapJsonArray<TagModel>(
            json['relatedTags'], (v) => TagModel.fromJson(v)),
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
