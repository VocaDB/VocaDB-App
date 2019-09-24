import 'dart:async';

import 'package:rxdart/subjects.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/services/entry_service.dart';

class SearchBloc {
  final BehaviorSubject<String> _query = BehaviorSubject<String>();
  final BehaviorSubject<EntryType> _entryType =
      BehaviorSubject<EntryType>.seeded(EntryType.Undefined);
  final BehaviorSubject<List<EntryModel>> _results =
      BehaviorSubject<List<EntryModel>>();

  Stream<String> get queryStream => _query.stream;
  Stream<EntryType> get entryTypeStream => _entryType.stream;
  Stream<List<EntryModel>> get resultStream => _results.stream;

  String get query => _query.value;
  EntryType get entryType => _entryType.value;

  final EntryService entryService;

  SearchBloc(this.entryService) {
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
    entryService.query(query, entryType).then(updateResults);
  }

  void dispose() {
    _entryType.close();
    _results.close();
    _query.close();
  }
}
