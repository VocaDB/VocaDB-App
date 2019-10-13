import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vocadb/models/artist_model.dart';

class FavoriteArtistBloc {
  final _artists = BehaviorSubject<Map<int, ArtistModel>>();

  Observable get artists$ => _artists.stream;

  Map<int, ArtistModel> get artists => _artists.value;

  Box _personalBox;

  FavoriteArtistBloc() {
    _personalBox = Hive.box('personal');

    initialLoad();
  }

  void initialLoad() {
    dynamic rawData = _personalBox.get('favorite_artists');

    if (rawData == null) {
      return;
    }

    Map<String, dynamic> jsonMap = json.decode(rawData);

    Map<int, ArtistModel> mapArtists = jsonMap.map(
        (key, value) => MapEntry(int.parse(key), ArtistModel.fromJson(value)));

    _artists.add(mapArtists);
  }

  void save(Map<int, ArtistModel> artists) {
    Map<String, Map<String, dynamic>> jsonMap =
        artists.map((key, value) => MapEntry(key.toString(), value.toJson()));

    _personalBox.put('favorite_artists', json.encode(jsonMap));
  }

  void add(ArtistModel artist) {
    Map<int, ArtistModel> map = _artists.value ?? {};
    map.putIfAbsent(artist.id, () => artist);
    _artists.add(map);

    save(map);
  }

  void remove(int id) {
    if (_artists.value == null || _artists.value.isEmpty) return;

    Map<int, ArtistModel> map = _artists.value;
    map.remove(id);

    _artists.add(map);

    save(map);
  }

  void dispose() {
    _artists?.close();
  }
}
