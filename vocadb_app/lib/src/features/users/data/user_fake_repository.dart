import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/albums/data/constants/fake_album_collections.dart';
import 'package:vocadb_app/src/features/albums/domain/album_collection.dart';
import 'package:vocadb_app/src/features/artists/data/constants/fake_followed_artist.dart';
import 'package:vocadb_app/src/features/artists/domain/followed_artist.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_songs_list.dart';
import 'package:vocadb_app/src/features/songs/data/constants/song_rating.dart';
import 'package:vocadb_app/src/features/songs/domain/rated_song.dart';
import 'package:vocadb_app/src/features/users/data/user_repository.dart';
import 'package:vocadb_app/src/features/users/domain/followed_artists_list_params.dart';
import 'package:vocadb_app/src/features/users/domain/rated_songs_list_params.dart';
import 'package:vocadb_app/src/features/users/domain/user_albums_list_params.dart';

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

  @override
  Future<List<FollowedArtist>> fetchFollowedArtistsList(
      int userID, FollowedArtistsListParams params) async {
    return Future.value(kFakeFollowedArtistsList);
  }

  @override
  Future<List<AlbumCollection>> fetchAlbums(
      int userID, UserAlbumsListParams params) async {
    return Future.value(kFakeAlbumCollections.toList());
  }
}

final userFakeRepositoryProvider = Provider<UserFakeRepository>((ref) {
  return UserFakeRepository();
});
