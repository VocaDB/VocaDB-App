import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/release_event_rest_service.dart';

class ReleaseEventDetailBloc {
  final _releaseEvents = BehaviorSubject<ReleaseEventModel>();
  final _songs = BehaviorSubject<List<SongModel>>();
  final _albums = BehaviorSubject<List<AlbumModel>>();

  final int id;

  Observable get releaseEvent$ => _releaseEvents.stream;
  Observable get songs$ => _songs.stream;
  Observable get albums$ => _albums.stream;

  ReleaseEventRestService releaseEventService;

  ConfigBloc configBloc;

  ReleaseEventDetailBloc(this.id,
      {ReleaseEventRestService releaseEventService, this.configBloc}) {
    this.releaseEventService ??=
        releaseEventService ?? ReleaseEventRestService();

    fetch();
    fetchSongs();
    fetchAlbums();
  }

  Future<void> fetch() async {
    return releaseEventService
        .byId(this.id, lang: configBloc.contentLang)
        .then(_releaseEvents.add);
  }

  Future<void> fetchSongs() async {
    return releaseEventService
        .publishedSongs(this.id, lang: configBloc.contentLang)
        .then(_songs.add);
  }

  Future<void> fetchAlbums() async {
    return releaseEventService
        .albums(this.id, lang: configBloc.contentLang)
        .then(_albums.add);
  }

  void dispose() {
    _releaseEvents?.close();
    _songs?.close();
    _albums?.close();
  }
}
