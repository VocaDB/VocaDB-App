import 'dart:convert';

import 'package:vocadb/models/main_picture.dart';
import 'package:vocadb/services/web_service.dart';

class Album {
  int id;
  String name;
  String artistString;
  MainPicture mainPicture;

  Album.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    artistString = json['artistString'],
    mainPicture = MainPicture.fromJson(json['mainPicture']);

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

  get imageurl => (mainPicture != null && mainPicture.urlThumb != null) ? mainPicture.urlThumb : ''; 
}