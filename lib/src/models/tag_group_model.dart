import 'package:equatable/equatable.dart';
import 'package:vocadb_app/models.dart';

class TagGroupModel extends Equatable {
  int count;
  TagModel tag;

  @override
  List<Object> get props => [count, tag];

  TagGroupModel.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        tag = json.containsKey('tag') ? TagModel.fromJson(json['tag']) : null;
}
