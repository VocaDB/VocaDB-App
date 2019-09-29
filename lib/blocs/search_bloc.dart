import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:vocadb/blocs/search_album_filter_bloc.dart';
import 'package:vocadb/blocs/search_artist_filter_bloc.dart';
import 'package:vocadb/blocs/search_entry_filter_bloc.dart';
import 'package:vocadb/blocs/search_song_filter_bloc.dart';
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
  SearchSongFilterBloc songFilterBloc;
  SearchArtistFilterBloc artistFilterBloc;
  SearchAlbumFilterBloc albumFilterBloc;

  SearchBloc(
      {this.entryService,
      this.songFilterBloc,
      this.artistFilterBloc,
      this.albumFilterBloc,
      this.entryFilterBloc}) {
    this.entryService ??= EntryService();
    this.entryFilterBloc ??= SearchEntryFilterBloc();
    this.songFilterBloc ??= SearchSongFilterBloc();
    this.artistFilterBloc ??= SearchArtistFilterBloc();
    this.albumFilterBloc ??= SearchAlbumFilterBloc();

    Observable.merge([
      queryStream,
      entryTypeStream,
      entryFilterBloc.params$,
      songFilterBloc.params$,
      artistFilterBloc.params$,
      albumFilterBloc.params$
    ]).debounceTime(Duration(milliseconds: 500)).distinct().listen(fetch);
  }

  void updateResults(List<EntryModel> entries) {
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
    print('event : $event');
    if (!isSearching) return;

    Map<String, String> params = getParamsByEntryType();

    entryService.search(query, entryType, params: params).then(updateResults);
  }

  Map<String, String> getParamsByEntryType() {
    switch (entryType) {
      case EntryType.Undefined:
        return entryFilterBloc.params();
      case EntryType.Song:
        return songFilterBloc.params();
      case EntryType.Artist:
        return artistFilterBloc.params();
      case EntryType.Album:
        return albumFilterBloc.params();
      default:
        return {};
    }
  }

  void dispose() {
    _entryType?.close();
    _results?.close();
    _query?.close();
    _isSearching?.close();
  }

  void onParamsChanged(event) {
    print(getParamsByEntryType());
  }
}
