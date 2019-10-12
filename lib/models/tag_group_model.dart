import 'package:vocadb/models/tag_model.dart';

class TagGroupModel {
  int count;
  TagModel tag;

  TagGroupModel.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        tag = json.containsKey('tag') ? TagModel.fromJson(json['tag']) : null;
}
