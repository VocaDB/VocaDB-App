import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/album_rest_service.dart';
import 'package:vocadb/services/song_rest_service.dart';

class HomeBloc {
  final _highlighted = BehaviorSubject<List<SongModel>>.seeded(null);
  final _latestAlbums = BehaviorSubject<List<AlbumModel>>.seeded(null);
  final _topAlbums = BehaviorSubject<List<AlbumModel>>.seeded(null);

  Observable get highlighted$ => _highlighted.stream;
  Observable get latestAlbums$ => _latestAlbums.stream;
  Observable get topAlbums$ => _topAlbums.stream;

  final ConfigBloc configBloc;
  final _songService = SongRestService();
  final _albumService = AlbumRestService();

  HomeBloc(this.configBloc) {
    fetch();
  }

  void fetch() {
    updateHighlighted();
    updateLatestAlbums();
    updateTopAlbums();
  }

  Future<void> updateHighlighted() async {
    print('update highlighted...');
    _songService
        .highlighted(lang: configBloc.contentLang)
        .then(_highlighted.add);
  }

  Future<void> updateLatestAlbums() async {
    print('update latest albums...');
    _albumService.latest(lang: configBloc.contentLang).then(_latestAlbums.add);
  }

  Future<void> updateTopAlbums() async {
    print('update top albums...');
    _albumService.top(lang: configBloc.contentLang).then(_topAlbums.add);
  }

  void dispose() {
    _highlighted.close();
    _latestAlbums.close();
    _topAlbums.close();
  }
}
