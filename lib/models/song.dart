import 'dart:convert';

import 'package:vocadb/models/pv.dart';
import 'package:vocadb/services/web_service.dart';

class Song {
  int id;
  String name;
  String artistString;
  String thumbUrl;
  List<PV> pvs;

  Song();

  Song.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    artistString = json['artistString'],
    thumbUrl = json['thumbUrl'],
    pvs = (json['pvs'] as List<Map<String, dynamic>>)?.map((pv) => PV.fromJson(pv))?.toList();

  PV get youtubePV => pvs?.singleWhere((pv) => pv.service.toLowerCase() == "youtube", orElse: () => null);

  static Resource<List<Song>> get all {
    
    return Resource(
      url: 'https://vocadb.net/api/songs/highlighted?fields=ThumbUrl',
      parse: (response) {
        Iterable result = json.decode(response.body);
        return result.map((model) => Song.fromJson(model)).toList();
      }
    );

  }

  static Resource<Song> byId(int id) {
    
    return Resource(
      url: 'https://vocadb.net/api/songs/$id?fields=PVs,ThumbUrl,Albums,Artists,Tags,WebLinks',
      parse: (response) {
        final result = json.decode(response.body);
        return Song.fromJson(result);
      }
    );

  }
}