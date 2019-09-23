import 'dart:async';

import 'package:dio/dio.dart';
import 'package:rxdart/subjects.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/services/web_service.dart';

class SearchBloc {
  final BehaviorSubject<String> _query = BehaviorSubject<String>();
  final BehaviorSubject<EntryType> _entryType = BehaviorSubject<EntryType>.seeded(EntryType.Undefined);
  final BehaviorSubject<List<EntryModel>> _results = BehaviorSubject<List<EntryModel>>(); 
  
  Stream<String> get queryStream => _query.stream;
  Stream<EntryType> get entryTypeStream => _entryType.stream;
  Stream<List<EntryModel>> get resultStream => _results.stream;

  String get query => _query.value;
  EntryType get entryType => _entryType.value;
  

  SearchBloc() {
    _query.listen(onQueryChanged);
    _entryType.listen(onEntryTypeChanged);
    _results.listen(print);
  }

  void updateResults(List<EntryModel> entries) {
    _results.add(entries);
  }

  void updateQuery(String str) {
    _query.add(str);
  }

  void clearQuery() {
    _query.add('');
  }

  void updateEntryType(EntryType entryType) {
    _entryType.add(entryType);
  }

  void onQueryChanged(String query) {
    fetch();
  }

  void onEntryTypeChanged(EntryType entryType) {
    fetch();
  }

  void fetch() {

    String endpoint = '';
    
    switch(entryType) {
      case EntryType.Song:
        endpoint = '/api/songs?query=$query&fields=MainPicture';
        break;

      case EntryType.Album:
        endpoint = '/api/albums?query=$query&fields=MainPicture';
        break;

      case EntryType.Artist:
        endpoint = '/api/artists?query=$query&fields=MainPicture';
        break;
      
      default:
        endpoint = '/api/entries?query=$query&fields=MainPicture&nameMatchMode=auto';
        break;
    }

    final resource = Resource(
            endpoint: endpoint,
            parse: (Response response) {
              Iterable result = response.data['items'];
              return result.map((model) {
                EntryModel em = EntryModel.fromJson(model);
                if(entryType != EntryType.Undefined) {
                  em.entryType = entryType;
                }
                return em;
              }).toList();
            });
    
    WebService().load(resource).then(updateResults);
  }

  void dispose() {
    _entryType.close();
    _results.close();
    _query.close();
  }

}