import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/album_rest_service.dart';
import 'package:vocadb/services/artist_rest_service.dart';
import 'package:vocadb/services/song_rest_service.dart';
import 'package:vocadb/services/tag_rest_service.dart';

class TagDetailBloc {
  final _tag = BehaviorSubject<TagModel>();
  final _latestSongs = BehaviorSubject<List<SongModel>>();
  final _topSongs = BehaviorSubject<List<SongModel>>();
  final _topAlbums = BehaviorSubject<List<AlbumModel>>();
  final _topArtists = BehaviorSubject<List<ArtistModel>>();

  final int id;

  Observable get tag$ => _tag.stream;
  Observable get latestSongs$ => _latestSongs.stream;
  Observable get topSongs$ => _topSongs.stream;
  Observable get topAlbums$ => _topAlbums.stream;
  Observable get topArtists$ => _topArtists.stream;

  TagRestService tagService;
  SongRestService songService;
  ArtistRestService artistService;
  AlbumRestService albumService;

  ConfigBloc configBloc;

  TagDetailBloc(this.id,
      {TagRestService tagService,
      this.configBloc,
      this.songService,
      this.artistService,
      this.albumService}) {
    this.tagService ??= tagService ?? TagRestService();
    this.songService ??= SongRestService();
    this.artistService ??= ArtistRestService();
    this.albumService ??= AlbumRestService();

    fetch();
    fetchLatestSongs();
    fetchTopSongs();
    fetchTopAlbums();
    fetchTopArtists();
  }

  Future<void> fetch() async {
    return tagService
        .byId(this.id, lang: configBloc.contentLang)
        .then(_tag.add);
  }

  Future<void> fetchLatestSongs() async {
    return songService
        .latestByTagId(this.id, lang: configBloc.contentLang)
        .then(_latestSongs.add);
  }

  Future<void> fetchTopSongs() async {
    return songService
        .topByTagId(this.id, lang: configBloc.contentLang)
        .then(_topSongs.add);
  }

  Future<void> fetchTopAlbums() async {
    return albumService
        .topByTagId(this.id, lang: configBloc.contentLang)
        .then(_topAlbums.add);
  }

  Future<void> fetchTopArtists() async {
    return artistService
        .topByTagId(this.id, lang: configBloc.contentLang)
        .then(_topArtists.add);
  }

  void dispose() {
    _tag?.close();
    _latestSongs?.close();
    _topSongs?.close();
    _topAlbums?.close();
    _topArtists?.close();
  }
}
