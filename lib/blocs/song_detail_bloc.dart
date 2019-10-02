import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/song_rest_service.dart';

class SongDetailBloc {
  final _song = BehaviorSubject<SongModel>.seeded(null);
  final _originalVersion = BehaviorSubject<SongModel>.seeded(null);
  final _altVersions = BehaviorSubject<List<SongModel>>.seeded(null);
  final _relatedSongs = BehaviorSubject<List<SongModel>>.seeded(null);

  final int id;

  Observable get song$ => _song.stream;
  Observable get originalVersion$ => _originalVersion.stream;
  Observable get altVersions$ => _altVersions.stream;
  Observable get relatedSongs$ => _relatedSongs.stream;

  SongRestService songService = SongRestService();

  ConfigBloc configBloc;

  SongDetailBloc(this.id,
      {SongRestService songService, ConfigBloc configBloc}) {
    this.songService ??= songService;
    this.configBloc ??= configBloc;

    _song.distinct().listen(onFetched);
    fetch();
  }

  void onFetched(SongModel song) {
    if (song == null) {
      return;
    }

    if (song.originalVersionId != null) {
      fetchOriginalVersion(song.originalVersionId);
    }

    fetchAlternateVersions(song.id);
    fetchRelated(song.id);
  }

  Future<void> fetch() async {
    return songService
        .byId(this.id, lang: configBloc.contentLang)
        .then(_song.add);
  }

  Future<void> fetchOriginalVersion(int id) async {
    songService
        .byId(id, lang: configBloc.contentLang)
        .then(_originalVersion.add);
  }

  Future<void> fetchAlternateVersions(int id) async {
    songService
        .derived(id, lang: configBloc.contentLang)
        .then((songs) => songs.take(20).toList())
        .then(_altVersions.add);
  }

  Future<void> fetchRelated(int id) async {
    songService
        .related(id, lang: configBloc.contentLang)
        .then((songs) => songs.take(20).toList())
        .then(_relatedSongs.add);
  }

  void dispose() {
    _song?.close();
    _originalVersion?.close();
    _altVersions?.close();
    _relatedSongs?.close();
  }
}
