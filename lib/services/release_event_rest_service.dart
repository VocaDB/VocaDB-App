import 'dart:async';

import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/base_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class ReleaseEventRestService extends BaseRestService {
  ReleaseEventRestService({RestApi restApi}) : super(restApi: restApi);

  Future<List<ReleaseEventModel>> list({Map<String, String> params}) async {
    final String endpoint = '/api/releaseEvents';

    params ??= {};

    return super
        .query(endpoint, params)
        .then((items) => ReleaseEventModel.jsonToList(items));
  }

  Future<List<ReleaseEventModel>> latest({String lang = 'Default'}) async {
    final Map<String, String> params = {
      'fields': 'MainPicture',
      'sort': 'Date',
      'lang': lang
    };

    return this.list(params: params);
  }

  Future<ReleaseEventModel> byId(int id, {String lang = 'Default'}) {
    final Map<String, String> params = {
      'fields': 'Artists,MainPicture,AdditionalNames,Description,WebLinks',
      'lang': lang,
    };

    return super
        .getObject('/api/releaseEvents/$id', params)
        .then((i) => ReleaseEventModel.fromJson(i));
  }

  Future<List<AlbumModel>> albums(int id, {String lang = 'Default'}) async {
    final Map<String, String> params = {
      'fields': 'MainPicture',
      'lang': lang,
    };
    return super
        .query('/api/releaseEvents/$id/albums', params)
        .then((items) => AlbumModel.jsonToList(items));
  }

  Future<List<SongModel>> publishedSongs(int id,
      {String lang = 'Default'}) async {
    final Map<String, String> params = {
      'fields': 'MainPicture,PVs,ThumbUrl',
      'lang': lang,
    };
    return super
        .query('/api/releaseEvents/$id/published-songs', params)
        .then((items) => SongModel.jsonToList(items));
  }
}
