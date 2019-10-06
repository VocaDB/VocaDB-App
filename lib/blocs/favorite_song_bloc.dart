import 'package:rxdart/rxdart.dart';
import 'package:vocadb/models/song_model.dart';

class FavoriteSongBloc {
  final _songs = BehaviorSubject<Map<int, SongModel>>();

  Observable get songs$ => _songs.stream;

  Map<int, SongModel> get songs => _songs.value;

  void add(SongModel song) {
    Map<int, SongModel> map = _songs.value ?? {};
    map.putIfAbsent(song.id, () => song);
    _songs.add(map);
  }

  void remove(int id) {
    if (_songs.value == null || _songs.value.isEmpty) return;

    Map<int, SongModel> map = _songs.value;
    map.remove(id);

    _songs.add(map);
  }

  void dispose() {
    _songs?.close();
  }
}
