import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/services/album_rest_service.dart';

class AlbumDetailBloc {
  final _album = BehaviorSubject<AlbumModel>();

  final int id;

  Observable get album$ => _album.stream;

  AlbumRestService albumService;

  ConfigBloc configBloc;

  AlbumDetailBloc(this.id,
      {AlbumRestService albumService, this.configBloc}) {
    this.albumService ??= albumService ?? AlbumRestService();

    fetch();
  }

  Future<void> fetch() async {
    return albumService
        .byId(this.id, lang: configBloc.contentLang)
        .then(_album.add);
  }

  void dispose() {
    _album?.close();
  }
}
