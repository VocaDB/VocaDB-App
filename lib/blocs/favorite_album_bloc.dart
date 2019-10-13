import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vocadb/models/album_model.dart';

class FavoriteAlbumBloc {
  final _albums = BehaviorSubject<Map<int, AlbumModel>>();

  Observable get albums$ => _albums.stream;

  Map<int, AlbumModel> get albums => _albums.value ?? {};

  List<AlbumModel> get albumList =>
      (albums == null) ? [] : albums.values.toList();

  Box _personalBox;

  FavoriteAlbumBloc() {
    _personalBox = Hive.box('personal');

    initialLoad();
  }

  void initialLoad() {
    dynamic rawData = _personalBox.get('favorite_albums');

    if (rawData == null) {
      return;
    }

    Map<String, dynamic> jsonMap = json.decode(rawData);

    Map<int, AlbumModel> mapAlbums = jsonMap.map(
        (key, value) => MapEntry(int.parse(key), AlbumModel.fromJson(value)));

    _albums.add(mapAlbums);
  }

  void update(List<AlbumModel> albums) {
    Map<int, AlbumModel> mapAlbums = this.albums;
    albums
        .where((v) => v != null)
        .forEach((v) => mapAlbums.putIfAbsent(v.id, () => v));
    _albums.add(mapAlbums);
  }

  void save(Map<int, AlbumModel> albums) {
    Map<String, Map<String, dynamic>> jsonMap =
        albums.map((key, value) => MapEntry(key.toString(), value.toJson()));

    _personalBox.put('favorite_albums', json.encode(jsonMap));
  }

  void add(AlbumModel album) {
    Map<int, AlbumModel> map = _albums.value ?? {};
    map.putIfAbsent(album.id, () => album);
    _albums.add(map);

    save(map);
  }

  void remove(int id) {
    if (_albums.value == null || _albums.value.isEmpty) return;

    Map<int, AlbumModel> map = _albums.value;
    map.remove(id);

    _albums.add(map);

    save(map);
  }

  void dispose() {
    _albums?.close();
  }
}
