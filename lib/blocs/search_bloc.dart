import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/services/entry_service.dart';

class SearchBloc {
  final _query = BehaviorSubject<String>();
  final _entryType = BehaviorSubject<EntryType>.seeded(EntryType.Undefined);
  final _results = BehaviorSubject<List<EntryModel>>();
  final _isSearching = BehaviorSubject<bool>.seeded(false);

  Stream<String> get queryStream => _query.stream;
  Stream<EntryType> get entryTypeStream => _entryType.stream;
  Stream<List<EntryModel>> get resultStream => _results.stream;
  Observable get isSearching$ => _isSearching.stream;

  String get query => _query.value;
  EntryType get entryType => _entryType.value;
  bool get isSearching => _isSearching.value;

  EntryService entryService;

  SearchBloc({this.entryService}) {
    this.entryService ??= EntryService();
    _query.listen(onQueryChanged);
    _entryType.listen(onEntryTypeChanged);
    _results.listen(print);
  }

  void updateResults(List<EntryModel> entries) {
    _results.add(entries);
  }

  void updateQuery(String str) {
    if (str == null || str.isEmpty) {
      toggleSearching(false);
      updateResults(null);
    } else {
      toggleSearching(true);
      _query.add(str);
    }
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

  void onQueryChanged(String query) {
    fetch();
  }

  void onEntryTypeChanged(EntryType entryType) {
    fetch();
  }

  void fetch() {
    if (!isSearching) return;

    entryService.search(query, entryType).then(updateResults);
  }

  void dispose() {
    _entryType?.close();
    _results?.close();
    _query?.close();
    _isSearching?.close();
  }
}
