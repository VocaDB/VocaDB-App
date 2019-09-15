import 'dart:convert';

import 'package:vocadb/models/artist_relations_model.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/tag_group_model.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/web_service.dart';

class ArtistModel {
  int id;
  String name;
  String artistType;
  String additionalNames;
  ArtistRelations relations;
  List<TagGroupModel> tagGroups;

  ArtistModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        artistType = json['artistType'],
        additionalNames = json['additionalNames'],
        relations = (json.containsKey('relations'))
            ? ArtistRelations.fromJson(json['relations'])
            : null,
        tagGroups = (json.containsKey('tags'))
            ? (json['tags'] as List)
                ?.map((d) => TagGroupModel.fromJson(d))
                ?.toList()
            : null;

  ArtistModel.fromEntry(EntryModel entry)
      : id = entry.id,
        name = entry.name,
        artistType = entry.artistType;

  String get imageUrl => 'https://vocadb.net/Artist/Picture/$id';

  List<TagModel> get tags =>
      (this.tagGroups != null) ? this.tagGroups.map((t) => t.tag).toList() : [];

  static Resource<ArtistModel> byId(int id) {
    return Resource(
        url: 'https://vocadb.net/api/artists/$id?fields=Tags&relations=All',
        parse: (response) {
          final result = json.decode(response.body);
          return ArtistModel.fromJson(result);
        });
  }
}
