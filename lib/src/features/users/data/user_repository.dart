import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/features/albums/domain/album_collection.dart';
import 'package:vocadb_app/src/features/artists/domain/followed_artist.dart';
import 'package:vocadb_app/src/features/songs/domain/rated_song.dart';
import 'package:vocadb_app/src/features/users/data/user_api_repository.dart';
import 'package:vocadb_app/src/features/users/data/user_fake_repository.dart';
import 'package:vocadb_app/src/features/users/domain/followed_artists_list_params.dart';
import 'package:vocadb_app/src/features/users/domain/rated_songs_list_params.dart';
import 'package:vocadb_app/src/features/users/domain/user_albums_list_params.dart';

abstract class UserRepository {
  Future<String> fetchRatedSongID(int userID, int songID);

  Future<List<RatedSong>> fetchRatedSongsList(
    int userID,
    RatedSongsListParams params,
  );

  Future<List<FollowedArtist>> fetchFollowedArtistsList(
    int userID,
    FollowedArtistsListParams params,
  );

  Future<List<AlbumCollection>> fetchAlbums(
    int userID,
    UserAlbumsListParams params,
  );
}

/// Providers
final userRepositoryProvider = Provider.autoDispose<UserRepository>((ref) {
  final config = ref.read(flavorConfigProvider);
  return (config.useFakeData)
      ? ref.watch(userFakeRepositoryProvider)
      : ref.watch(userApiRepositoryProvider);
});
