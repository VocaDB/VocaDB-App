import 'dart:convert';

import 'package:vocadb/services/web_service.dart';

class Song {
  int id;
  String name;
  String artistString;
  String thumbUrl;

  Song.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    artistString = json['artistString'],
    thumbUrl = json['thumbUrl'];

  static Resource<List<Song>> get all {
    
    return Resource(
      url: 'https://vocadb.net/api/songs/highlighted?fields=ThumbUrl',
      parse: (response) {
        Iterable result = json.decode(response.body);
        return result.map((model) => Song.fromJson(model)).toList();
      }
    );

  }
}