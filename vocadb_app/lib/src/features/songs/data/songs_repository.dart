import 'package:vocadb_app/src/features/songs/data/test_songs.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

class SongRepository {
  SongRepository._();
  static SongRepository instance = SongRepository._();

  final List<Song> _mockSongs = kTestSongs;

  List<Song> getHighlightedSongsList() {
    return _mockSongs;
  }

  Future<List<Song>> fetchHighlightedSongs() {
    return Future.value(_mockSongs);
  }
}
