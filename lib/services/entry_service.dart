import 'dart:async';

import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/base_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class EntryService extends BaseRestService {
  EntryService({RestApi restApi}) : super(restApi: restApi);

  List<EntryModel> jsonToList(List items) {
    return items.map((i) => EntryModel.fromJson(i)).toList();
  }

  Future<List<EntryModel>> search(String query, EntryType entryType,
      {Map<String, String> params}) {
    final String endpoint = '/api/entries';
    String entryTypeText = EntryModel.entryTypeEnumToString(entryType);

    params ??= {};

    if (query != null && query.isNotEmpty) {
      params['query'] = query;
    }

    params.addAll({
      'fields': 'MainPicture',
      'entryTypes': entryTypeText,
      'nameMatchMode': 'Auto',
      'maxResults': '30'
    });

    return super.query(endpoint, params).then((items) {
      switch (entryType) {
        case EntryType.Song:
          return SongModel.jsonToList(items);
        case EntryType.Artist:
          return ArtistModel.jsonToList(items);
        case EntryType.Album:
          return AlbumModel.jsonToList(items);
        case EntryType.ReleaseEvent:
          return ReleaseEventModel.jsonToList(items);
        default:
          return EntryModel.jsonToList(items);
      }
    });
  }
}
