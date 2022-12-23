import 'package:vocadb_app/src/features/songs/data/test_single_song.dart';
import 'package:vocadb_app/src/features/songs/data/test_songs.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

class SongRepository {
  SongRepository._();
  static SongRepository instance = SongRepository._();

  final List<Song> _mockSongs = kTestSongs;
  final Song _mockSong = kTestSong;

  List<Song> getHighlightedSongsList() {
    return _mockSongs;
  }

  Song getSongByID(String id) {
    return _mockSong;
  }

  Future<List<Song>> fetchHighlightedSongs() {
    return Future.value(_mockSongs);
  }
}
