import 'package:vocadb_app/src/features/songs/data/constants/song_rating.dart';
import 'package:vocadb_app/src/features/songs/data/test_songs.dart';
import 'package:vocadb_app/src/features/songs/domain/rated_song.dart';

final kFakeRatedSongsList =
    kTestSongs.map((e) => RatedSong(song: e, rating: SongRating.Like.name));
