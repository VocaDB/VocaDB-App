import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vocadb/models/song_model.dart';

class FavoriteSongBloc {
  final _songs = BehaviorSubject<Map<int, SongModel>>();

  Observable get songs$ => _songs.stream;

  Map<int, SongModel> get songs => _songs.value;

  Box _personalBox;

  FavoriteSongBloc() {
    _personalBox = Hive.box('personal');

    initialLoad();
  }

  void initialLoad() {
    Map<String, dynamic> jsonMap =
        json.decode(_personalBox.get('favorite_songs'));

    Map<int, SongModel> mapSongs = jsonMap.map(
        (key, value) => MapEntry(int.parse(key), SongModel.fromJson(value)));

    _songs.add(mapSongs);
  }

  void save(Map<int, SongModel> songs) {
    Map<String, Map<String, dynamic>> jsonMap =
        songs.map((key, value) => MapEntry(key.toString(), value.toJson()));

    _personalBox.put('favorite_songs', json.encode(jsonMap));
  }

  void add(SongModel song) {
    Map<int, SongModel> map = _songs.value ?? {};
    map.putIfAbsent(song.id, () => song);
    _songs.add(map);

    save(map);
  }

  void remove(int id) {
    if (_songs.value == null || _songs.value.isEmpty) return;

    Map<int, SongModel> map = _songs.value;
    map.remove(id);

    _songs.add(map);

    save(map);
  }

  void dispose() {
    _songs?.close();
  }
}
