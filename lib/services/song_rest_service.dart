import 'dart:async';

import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/base_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class SongRestService extends BaseRestService {
  SongRestService(RestService restService) : super(restService);

  Future<List<SongModel>> highlighted({String lang = 'Default'}) async {
    final String endpoint = '/api/songs/highlighted';
    final Map<String, String> params = {'fields': 'ThumbUrl,PVs'};
    params['languagePreference'] = lang;
    return super
        .query(endpoint, params)
        .then((items) => SongModel.jsonToList(items));
  }

  Future<List<SongModel>> topRated({int durationHours = 0, String lang = 'Default'}) async {
    final String endpoint = '/api/songs/top-rated';
    final Map<String, String> params = {
      'fields': 'MainPicture,ThumbUrl,PVs',
      'languagePreference': lang,
      'filterBy': 'CreateDate'
    };

    if(durationHours != 0) {
      params['durationHours'] = durationHours.toString();
    }
    return super
        .query(endpoint, params)
        .then((items) => SongModel.jsonToList(items));
  }
}
