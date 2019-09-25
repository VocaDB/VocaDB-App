import 'dart:async';

import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/base_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class SongRestService extends BaseRestService<SongModel> {

  SongRestService(RestService restService) : super(restService);

  @override
  SongModel mapModel(Map json) {
    return SongModel.fromJson(json);
  }

  Future<List<SongModel>> highlighted() async {
    return super.query('/api/songs/highlighted', {
      'fields': 'ThumbUrl,PVs'
    });
  }
}