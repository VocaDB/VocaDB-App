import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/search_entry_filter_bloc.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/services/entry_service.dart';

class SearchBloc {
  final _query = BehaviorSubject<String>();
  final _entryType = BehaviorSubject<EntryType>();
  final _results = BehaviorSubject<List<EntryModel>>();
  final _isSearching = BehaviorSubject<bool>.seeded(false);

  Observable<String> get queryStream => _query.stream;
  Observable<EntryType> get entryTypeStream => _entryType.stream;
  Observable<List<EntryModel>> get resultStream => _results.stream;
  Observable<bool> get isSearching$ => _isSearching.stream;

  String get query => _query.value;
  EntryType get entryType => _entryType.value ?? EntryType.Undefined;
  bool get isSearching => _isSearching.value;

  EntryService entryService;

  SearchEntryFilterBloc entryFilterBloc;
  ConfigBloc configBloc;

  SearchBloc({this.entryService, this.entryFilterBloc, this.configBloc}) {
    this.entryService ??= EntryService();
    this.entryFilterBloc ??= SearchEntryFilterBloc();

    Observable.merge([
      queryStream,
      entryTypeStream,
      entryFilterBloc.params$,
    ]).debounceTime(Duration(milliseconds: 500)).distinct().listen(fetch);
  }

  void updateResults(List<EntryModel> entries) {
    print(entries);
    _results.add(entries);
  }

  Future<void> updateQuery(String str) {
    if (str == null || str.isEmpty) {
      toggleSearching(false);
      updateResults(null);
    } else {
      toggleSearching(true);
      _query.add(str);
    }

    return Future.value();
  }

  void toggleSearching(bool searching) {
    _isSearching.add(searching);
  }

  void clearQuery() {
    _query.add('');
  }

  void updateEntryType(EntryType entryType) {
    _entryType.add(entryType);
  }

  void fetch(event) {
    if (!isSearching) return;

    Map<String, String> params = entryFilterBloc.params();

    String entryTypeStr = EntryModel.entryTypeEnumToString(entryType);

    if (entryTypeStr != 'Undefined') {
      params['entryType'] = entryTypeStr;
    }

    if (configBloc != null && configBloc.contentLang != null) {
      params['lang'] = configBloc.contentLang;
    }

    entryService.search(query, entryType, params: params).then(updateResults);
  }

  void dispose() {
    _entryType?.close();
    _results?.close();
    _query?.close();
    _isSearching?.close();
  }
}
