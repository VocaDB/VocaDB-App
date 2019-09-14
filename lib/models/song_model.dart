import 'dart:convert';

import 'package:vocadb/models/pv_model.dart';
import 'package:vocadb/services/web_service.dart';

class SongModel {
  int id;
  String name;
  String artistString;
  String thumbUrl;
  List<PVModel> pvs;

  SongModel();

  SongModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        artistString = json['artistString'],
        thumbUrl = json['thumbUrl'],
        pvs = (json['pvs'] as List<Map<String, dynamic>>)
            ?.map((pv) => PVModel.fromJson(pv))
            ?.toList();

  PVModel get youtubePV =>
      pvs?.singleWhere((pv) => pv.service.toLowerCase() == "youtube",
          orElse: () => null);

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
