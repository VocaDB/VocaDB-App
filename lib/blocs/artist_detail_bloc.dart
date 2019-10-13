import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/services/artist_rest_service.dart';

class ArtistDetailBloc {
  final _artist = BehaviorSubject<ArtistModel>();

  final int id;

  Observable get artist$ => _artist.stream;

  ArtistRestService artistService;

  ConfigBloc configBloc;

  ArtistDetailBloc(this.id,
      {ArtistRestService artistService, this.configBloc}) {
    this.artistService ??= artistService ?? ArtistRestService();

    fetch();
  }

  Future<void> fetch() async {
    return artistService
        .byId(this.id, lang: configBloc.contentLang)
        .then(_artist.add);
  }

  void dispose() {
    _artist?.close();
  }
}
