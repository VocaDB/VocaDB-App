import 'dart:convert';

import 'package:vocadb/models/main_picture.dart';
import 'package:vocadb/services/web_service.dart';

class Album {
  int id;
  String name;
  String defaultName;
  String artistString;
  MainPicture mainPicture;

  Album();

  Album.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    defaultName = json['defaultName'],
    artistString = json['artistString'],
    mainPicture = MainPicture.fromJson(json['mainPicture'] ?? {});

  static Resource<List<Album>> get all {
    
    return Resource(
      url: 'https://vocadb.net/api/albums/new?fields=MainPicture',
      parse: (response) {
        Iterable result = json.decode(response.body);
        return result.map((model) => Album.fromJson(model)).toList();
      }
    );
  }

  static Resource<List<Album>> get top {
    
    return Resource(
      url: 'https://vocadb.net/api/albums/top?fields=MainPicture',
      parse: (response) {
        Iterable result = json.decode(response.body);
        return result.map((model) => Album.fromJson(model)).toList();
      }
    );
  }

  static Resource<Album> byId(int id) {
    return Resource(
      url: 'https://vocadb.net/api/albums/$id',
      parse: (response) {
        final result = json.decode(response.body);
        return Album.fromJson(result);
      }
    );
  }

  get imageurl => (mainPicture != null && mainPicture.urlThumb != null) ? mainPicture.urlThumb : ''; 
}