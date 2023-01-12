import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_songs_list.dart';
import 'package:vocadb_app/src/features/songs/data/constants/song_rating.dart';
import 'package:vocadb_app/src/features/songs/domain/rated_song.dart';
import 'package:vocadb_app/src/features/users/data/user_repository.dart';
import 'package:vocadb_app/src/features/users/domain/rated_songs_list_params.dart';

class UserFakeRepository implements UserRepository {
  @override
  Future<String> fetchRatedSongID(int userID, int songID) {
    throw Future.value('Favorite');
  }

  @override
  Future<List<RatedSong>> fetchRatedSongsList(
      int userID, RatedSongsListParams params) async {
    final list = kFakeSongsList
        .map((e) => RatedSong(song: e, rating: SongRating.Like.name))
        .toList();
    return Future.value(list);
  }
}

final userFakeRepositoryProvider = Provider<UserFakeRepository>((ref) {
  return UserFakeRepository();
});
