import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/song_rest_service.dart';

class SongDetailBloc {
  final _song = BehaviorSubject<SongModel>.seeded(null);
  final _originalVersion = BehaviorSubject<SongModel>.seeded(null);

  final int id;

  Observable get song$ => _song.stream;
  Observable get originalVersion$ => _originalVersion.stream;

  SongRestService songService = SongRestService();

  ConfigBloc configBloc;

  SongDetailBloc(this.id,
      {SongRestService songService, ConfigBloc configBloc}) {
    this.songService ??= songService;
    this.configBloc ??= configBloc;

    _song.listen(onFetched);
    fetch();
  }

  void onFetched(SongModel song) {
    if (song != null && song.originalVersionId != null) {
      fetchOriginalVersion(song.originalVersionId);
    }
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

  void dispose() {
    _song?.close();
    _originalVersion?.close();
  }
}
