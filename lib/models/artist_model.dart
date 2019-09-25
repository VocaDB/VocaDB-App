import 'package:dio/dio.dart';
import 'package:vocadb/models/artist_relations_model.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/web_service.dart';

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

  String get imageUrl => 'https://vocadb.net/Artist/Picture/$id';

  List<TagModel> get tags =>
      (this.tagGroups != null) ? this.tagGroups.map((t) => t.tag).toList() : [];

  static ArtistModel _mapObjectResponse(Response response) {
    final result = response.data;
    return ArtistModel.fromJson(result);
  }

  static Resource<ArtistModel> byId(int id) {
    return Resource(
        endpoint: '/api/artists/$id?fields=Tags&relations=All',
        parse: _mapObjectResponse);
  }
}
