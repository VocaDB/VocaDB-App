import 'dart:async';

import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/services/base_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class EntryService extends BaseRestService<EntryModel> {
  final String endpoint = '/api/entries';

  EntryService(RestService restService) : super(restService);

  @override
  EntryModel mapModel(Map json) {
    return EntryModel.fromJson(json);
  }

  EntryModel mapModelEntryType(Map json, EntryType entryType) {
    var em = EntryModel.fromJson(json);

    if (entryType != EntryType.Undefined) {
      em.entryType = entryType;
    }

    return em;
  }

  Future<List<EntryModel>> search(String query, EntryType entryType) {
    String selectedEndpoint = getEndpointByEntryType(entryType);
    return restService
        .get(selectedEndpoint, {'query': query})
        .then((v) => v['items'] as Iterable)
        .then((items) =>
            items.map((_) => mapModelEntryType(_, entryType)).toList());
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
        return endpoint;
    }
  }
}
