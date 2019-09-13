import 'dart:convert';

import 'package:vocadb/models/main_picture.dart';
import 'package:vocadb/models/track.dart';
import 'package:vocadb/services/web_service.dart';

class Album {
  int id;
  String name;
  String defaultName;
  String artistString;
  MainPicture mainPicture;
  List<Track> tracks;

  Album();

  Album.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        defaultName = json['defaultName'],
        artistString = json['artistString'],
        mainPicture = json.containsKey('mainPicture')
            ? MainPicture.fromJson(json['mainPicture'])
            : null,
        tracks = (json.containsKey('tracks'))
            ? (json['tracks'] as List<Map<String, dynamic>>)
                ?.map((d) => Track.fromJson(d))
                ?.toList()
            : null;

  static Resource<List<Album>> get all {
    return Resource(
        url: 'https://vocadb.net/api/albums/new?fields=MainPicture',
        parse: (response) {
          Iterable result = json.decode(response.body);
          return result.map((model) => Album.fromJson(model)).toList();
        });
  }

  static Resource<List<Album>> get top {
    return Resource(
        url: 'https://vocadb.net/api/albums/top?fields=MainPicture',
        parse: (response) {
          Iterable result = json.decode(response.body);
          return result.map((model) => Album.fromJson(model)).toList();
        });
  }

  static Resource<Album> byId(int id) {
    return Resource(
        url: 'https://vocadb.net/api/albums/$id',
        parse: (response) {
          final result = json.decode(response.body);
          return Album.fromJson(result);
        });
  }

  get imageurl => (mainPicture != null && mainPicture.urlThumb != null)
      ? mainPicture.urlThumb
      : '';
}
