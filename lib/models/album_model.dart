import 'package:dio/dio.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/main_picture_model.dart';
import 'package:vocadb/models/tag_group_model.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/models/track_model.dart';
import 'package:vocadb/services/web_service.dart';

class AlbumModel {
  int id;
  String name;
  String defaultName;
  String artistString;
  MainPictureModel mainPicture;
  List<TrackModel> tracks;
  List<TagGroupModel> tagGroups;

  AlbumModel();

  AlbumModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        defaultName = json['defaultName'],
        artistString = json['artistString'],
        mainPicture = json.containsKey('mainPicture')
            ? MainPictureModel.fromJson(json['mainPicture'])
            : null,
        tracks = (json.containsKey('tracks'))
            ? (json['tracks'] as List)
                ?.map((d) => TrackModel.fromJson(d))
                ?.toList()
            : null,
        tagGroups = (json.containsKey('tags'))
            ? (json['tags'] as List)
                ?.map((d) => TagGroupModel.fromJson(d))
                ?.toList()
            : null;

  AlbumModel.fromEntry(EntryModel entry)
      : id = entry.id,
        name = entry.name,
        artistString = entry.artistString,
        mainPicture = entry.mainPicture;

  static AlbumModel _mapObjectResponse(Response response) {
    return AlbumModel.fromJson(response.data);
  }

  static List<AlbumModel> _mapArrayResponse(Response response) {
    Iterable result = response.data;
    return result.map((model) => AlbumModel.fromJson(model)).toList();
  }

  static Resource<AlbumModel> byId(int id) {
    return Resource(
        endpoint: '/api/albums/$id?fields=Tracks,Tags',
        parse: _mapObjectResponse);
  }

  static Resource<List<AlbumModel>> get all {
    return Resource(
        endpoint: '/api/albums/new?fields=MainPicture',
        parse: _mapArrayResponse);
  }

  static Resource<List<AlbumModel>> get top {
    return Resource(
        endpoint: '/api/albums/top?fields=MainPicture',
        parse: _mapArrayResponse);
  }

  get imageUrl => (mainPicture != null && mainPicture.urlThumb != null)
      ? mainPicture.urlThumb
      : 'https://vocadb.net/Album/CoverPicture/$id';

  List<TagModel> get tags =>
      (this.tagGroups != null) ? this.tagGroups.map((t) => t.tag).toList() : [];
}
