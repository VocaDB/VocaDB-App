import 'package:vocadb_app/src/features/songs/data/constants/song_rating.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_songs_list.dart';
import 'package:vocadb_app/src/features/songs/domain/rated_song.dart';

final kFakeRatedSongsList = kFakeSongsList
    .map((e) => RatedSong(song: e, rating: SongRating.Like.name))
    .toList();
