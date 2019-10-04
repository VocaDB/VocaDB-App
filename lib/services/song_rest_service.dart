import 'dart:async';

import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/base_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class SongRestService extends BaseRestService {
  SongRestService({RestApi restApi}) : super(restApi: restApi);

  Future<List<SongModel>> list({Map<String, String> params}) async {
    final String endpoint = '/api/songs';

    params ??= {};

    return super
        .query(endpoint, params)
        .then((items) => SongModel.jsonToList(items));
  }

  Future<List<SongModel>> highlighted({String lang = 'Default'}) async {
    final String endpoint = '/api/songs/highlighted';
    final Map<String, String> params = {'fields': 'ThumbUrl,PVs'};
    params['languagePreference'] = lang;
    return super
        .query(endpoint, params)
        .then((items) => SongModel.jsonToList(items));
  }

  Future<List<SongModel>> topRated(
      {int durationHours = 0, String lang = 'Default'}) async {
    final String endpoint = '/api/songs/top-rated';
    final Map<String, String> params = {
      'fields': 'MainPicture,ThumbUrl,PVs',
      'languagePreference': lang,
      'filterBy': 'CreateDate'
    };

    if (durationHours != 0) {
      params['durationHours'] = durationHours.toString();
    }
    return super
        .query(endpoint, params)
        .then((items) => SongModel.jsonToList(items));
  }

  Future<SongModel> byId(int id, {String lang = 'Default'}) {
    final Map<String, String> params = {
      'fields':
          'MainPicture,PVs,ThumbUrl,Albums,Artists,Tags,WebLinks,AdditionalNames,WebLinks,Lyrics',
      'lang': lang,
    };
    return super
        .getObject('/api/songs/$id', params)
        .then((i) => SongModel.fromJson(i));
  }

  Future<List<SongModel>> related(int id, {String lang = 'Default'}) async {
    final String endpoint = '/api/songs/$id/related';
    final Map<String, String> params = {
      'fields': 'MainPicture,ThumbUrl',
      'lang': lang,
    };

    return super
        .query(endpoint, params)
        .then((related) => SongModel.jsonToList(related['likeMatches']));
  }

  Future<List<SongModel>> derived(int id, {String lang = 'Default'}) async {
    final String endpoint = '/api/songs/$id/derived';
    final Map<String, String> params = {
      'fields': 'MainPicture,ThumbUrl',
      'lang': lang,
    };

    return super
        .query(endpoint, params)
        .then((items) => SongModel.jsonToList(items));
  }

  Future<List<SongModel>> latestByTagId(int tagId, {String lang = 'Default'}) async {
    final Map<String, String> params = {
      'tagId': tagId.toString(),
      'fields': 'MainPicture,ThumbUrl',
      'sort': 'AdditionDate',
      'lang': lang,
    };

    return this.list(params: params);
  }

  Future<List<SongModel>> topByTagId(int tagId, {String lang = 'Default'}) async {
    final Map<String, String> params = {
      'tagId': tagId.toString(),
      'fields': 'MainPicture,ThumbUrl',
      'sort': 'RatingScore',
      'lang': lang,
    };

    return this.list(params: params);
  }

  Future<List<SongModel>> latestByArtistId(int artistId, {String lang = 'Default'}) async {
    final Map<String, String> params = {
      'artistId': artistId.toString(),
      'fields': 'MainPicture,ThumbUrl',
      'sort': 'AdditionDate',
      'lang': lang,
    };

    return this.list(params: params);
  }
}