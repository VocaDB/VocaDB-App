import 'dart:async';

import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/base_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class EntryService extends BaseRestService {
  EntryService({RestApi restApi}) : super(restApi: restApi);

  List<EntryModel> jsonToList(List items) {
    return items.map((i) => EntryModel.fromJson(i)).toList();
  }

  Future<List<EntryModel>> search(String query, EntryType entryType) {
    final String endpoint = getEndpointByEntryType(entryType);
    final Map<String, String> params = {
      'fields': 'MainPicture',
      'nameMatchMode': 'Auto'
    };

    if (query != null && query.isNotEmpty) {
      params['query'] = query;
    }

    return super.query(endpoint, params).then((items) {
      switch (entryType) {
        case EntryType.Song:
          return SongModel.jsonToList(items);
        case EntryType.Artist:
          return ArtistModel.jsonToList(items);
        case EntryType.Album:
          return AlbumModel.jsonToList(items);
        default:
          return EntryModel.jsonToList(items);
      }
    });
  }

  String getEndpointByEntryType(EntryType entryType) {
    switch (entryType) {
      case EntryType.Song:
        return '/api/songs';
      case EntryType.Album:
        return '/api/albums';
      case EntryType.Artist:
        return '/api/artists';
      default:
        return '/api/entries';
    }
  }
}
