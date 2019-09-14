import 'dart:convert';

import 'package:vocadb/models/main_picture_model.dart';
import 'package:vocadb/models/track_model.dart';
import 'package:vocadb/services/web_service.dart';

class AlbumModel {
  int id;
  String name;
  String defaultName;
  String artistString;
  MainPictureModel mainPicture;
  List<TrackModel> tracks;

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
            : null;

  static Resource<List<AlbumModel>> get all {
    return Resource(
        url: 'https://vocadb.net/api/albums/new?fields=MainPicture',
        parse: (response) {
          Iterable result = json.decode(response.body);
          return result.map((model) => AlbumModel.fromJson(model)).toList();
        });
  }

  static Resource<List<AlbumModel>> get top {
    return Resource(
        url: 'https://vocadb.net/api/albums/top?fields=MainPicture',
        parse: (response) {
          Iterable result = json.decode(response.body);
          return result.map((model) => AlbumModel.fromJson(model)).toList();
        });
  }

  static Resource<AlbumModel> byId(int id) {
    print(id);
    return Resource(
        url: 'https://vocadb.net/api/albums/$id?fields=Tracks',
        parse: (response) {
          final result = json.decode(response.body);
          return AlbumModel.fromJson(result);
        });
  }

  get imageurl => (mainPicture != null && mainPicture.urlThumb != null)
      ? mainPicture.urlThumb
      : '';
}
