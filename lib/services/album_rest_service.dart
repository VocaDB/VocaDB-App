import 'dart:async';

import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/services/base_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class AlbumRestService extends BaseRestService {
  AlbumRestService({RestApi restApi}) : super(restApi: restApi);

  Future<List<AlbumModel>> list({Map<String, String> params}) async {
    final String endpoint = '/api/albums';

    params ??= {};

    return super
        .query(endpoint, params)
        .then((items) => AlbumModel.jsonToList(items));
  }

  Future<List<AlbumModel>> latest({String lang = 'Default'}) async {
    final String endpoint = '/api/albums/new';
    final Map<String, String> params = {'fields': 'MainPicture'};
    params['languagePreference'] = lang;
    return super
        .query(endpoint, params)
        .then((items) => AlbumModel.jsonToList(items));
  }

  Future<List<AlbumModel>> top({String lang = 'Default'}) async {
    final String endpoint = '/api/albums/top';
    final Map<String, String> params = {'fields': 'MainPicture'};
    params['languagePreference'] = lang;
    return super
        .query(endpoint, params)
        .then((items) => AlbumModel.jsonToList(items));
  }

  Future<AlbumModel> byId(int id, {String lang = 'Default'}) {
    final Map<String, String> params = {
      'fields':
          'Tags,MainPicture,Tracks,AdditionalNames,Artists,Description,WebLinks,PVs',
      'songFields': 'MainPicture,PVs,ThumbUrl',
      'lang': lang,
    };

    return super
        .getObject('/api/albums/$id', params)
        .then((i) => AlbumModel.fromJson(i));
  }

  Future<List<AlbumModel>> latestByArtistId(int artistId,
      {String lang = 'Default'}) async {
    final Map<String, String> params = {
      'artistId': artistId.toString(),
      'fields': 'MainPicture',
      'sort': 'AdditionDate',
      'lang': lang,
    };

    return this.list(params: params);
  }

  Future<List<AlbumModel>> latestByTagId(int tagId,
      {String lang = 'Default'}) async {
    final Map<String, String> params = {
      'tagId': tagId.toString(),
      'fields': 'MainPicture',
      'sort': 'AdditionDate',
      'lang': lang,
    };

    return this.list(params: params);
  }

  Future<List<AlbumModel>> topByTagId(int tagId,
      {String lang = 'Default'}) async {
    final Map<String, String> params = {
      'tagId': tagId.toString(),
      'fields': 'MainPicture',
      'sort': 'RatingScore',
      'lang': lang,
    };

    return this.list(params: params);
  }
}
