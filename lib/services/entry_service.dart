import 'dart:async';

import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/services/web_service.dart';

class EntryService {
  RestService restService;

  EntryService(this.restService);

  Future<List<EntryModel>> query(String query, EntryType entryType) async {
    return restService.get('/api/entries', {'query': query}).then((v) {
      Iterable it = v['items'];
      return it;
    }).then((items) => items.map((json) => EntryModel.fromJson(json)).toList());
  }
}
