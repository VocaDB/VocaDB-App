import 'package:vocadb/models/artist_relations_model.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/tag_model.dart';

class ArtistModel extends EntryModel {
  EntryType entryType = EntryType.Artist;
  String additionalNames;
  ArtistRelations relations;

  ArtistModel.fromJson(Map<String, dynamic> json)
      : additionalNames = json['additionalNames'],
        relations = (json.containsKey('relations'))
            ? ArtistRelations.fromJson(json['relations'])
            : null,
        super.fromJson(json);

  static List<ArtistModel> jsonToList(List items) {
    return items.map((i) => ArtistModel.fromJson(i)).toList();
  }

  String get imageUrl => 'https://vocadb.net/Artist/Picture/$id';

  List<TagModel> get tags =>
      (this.tagGroups != null) ? this.tagGroups.map((t) => t.tag).toList() : [];
}
