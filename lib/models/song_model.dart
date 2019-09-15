import 'dart:convert';

import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/artist_song_model.dart';
import 'package:vocadb/models/pv_model.dart';
import 'package:vocadb/models/tag_group_model.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/web_service.dart';

class SongModel {
  int id;
  String name;
  String artistString;
  String thumbUrl;
  List<PVModel> pvs;
  List<TagGroupModel> tagGroups;
  List<ArtistSongModel> artists;
  List<AlbumModel> albums;

  SongModel();

  SongModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        artistString = json['artistString'],
        thumbUrl = json['thumbUrl'],
        pvs = (json.containsKey('pvs'))
            ? (json['pvs'] as List)?.map((d) => PVModel.fromJson(d))?.toList()
            : null,
        tagGroups = (json.containsKey('tags'))
            ? (json['tags'] as List)
                ?.map((d) => TagGroupModel.fromJson(d))
                ?.toList()
            : null,
        artists = (json.containsKey('artists'))
            ? (json['artists'] as List)
                ?.map((d) => ArtistSongModel.fromJson(d))
                ?.toList()
            : null,
        albums = (json.containsKey('albums'))
            ? (json['albums'] as List)
                ?.map((d) => AlbumModel.fromJson(d))
                ?.toList()
            : null;

  PVModel get youtubePV =>
      pvs?.singleWhere((pv) => pv.service.toLowerCase() == "youtube",
          orElse: () => null);

  List<TagModel> get tags =>
      (this.tagGroups != null) ? this.tagGroups.map((t) => t.tag).toList() : [];

  static Resource<List<SongModel>> get all {
    return Resource(
        url: 'https://vocadb.net/api/songs/highlighted?fields=ThumbUrl',
        parse: (response) {
          Iterable result = json.decode(response.body);
          return result.map((model) => SongModel.fromJson(model)).toList();
        });
  }

  static Resource<SongModel> byId(int id) {
    return Resource(
        url:
            'https://vocadb.net/api/songs/$id?fields=PVs,ThumbUrl,Albums,Artists,Tags,WebLinks',
        parse: (response) {
          final result = json.decode(response.body);
          return SongModel.fromJson(result);
        });
  }
}
