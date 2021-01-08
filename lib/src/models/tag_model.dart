import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/utils.dart';

class TagModel extends EntryModel {
  String categoryName;
  String additionalNames;
  String description;
  String urlSlug;
  TagModel parent;
  List<TagModel> relatedTags;

  TagModel({int id, String name})
      : super(id: id, name: name, entryType: EntryType.Tag);

  TagModel.fromEntry(EntryModel entryModel)
      : super(
            id: entryModel.id, name: entryModel.name, entryType: EntryType.Tag);

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
        super.fromJson(json, entryType: EntryType.Tag);

  static List<TagModel> jsonToList(List items) {
    return items.map((i) => TagModel.fromJson(i)).toList();
  }

  get imageUrl => (mainPicture != null && mainPicture.urlThumb != null)
      ? mainPicture.urlThumb.replaceAll('-t.', '.')
      : null;

  String get originUrl => '$baseUrl/T/${this.id}';
}
