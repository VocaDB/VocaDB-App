import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/api/data/api_query_result.dart';
import 'package:vocadb_app/src/features/artists/domain/followed_artist.dart';
import 'package:vocadb_app/src/features/songs/domain/rated_song.dart';
import 'package:vocadb_app/src/features/users/data/user_repository.dart';
import 'package:vocadb_app/src/features/users/domain/followed_artists_list_params.dart';
import 'package:vocadb_app/src/features/users/domain/rated_songs_list_params.dart';

class UserApiRepository implements UserRepository {
  UserApiRepository({required this.client});

  final ApiClient client;

  @override
  Future<String> fetchRatedSongID(int userID, int songID) async {
    final response =
        await client.get('/api/users/$userID/ratedSongs/$songID', json: false);

    return response;
  }

  @override
  Future<List<RatedSong>> fetchRatedSongsList(
      int userID, RatedSongsListParams params) async {
    final mapParams = params.toJson();
    mapParams.remove('artistId');

    if (params.artistId != null) {
      mapParams['artistId[]'] =
          params.artistId?.map((e) => e.toString()).toList();
    }

    final response = await client.get(
      '/api/users/$userID/ratedSongs',
      params: mapParams,
    );

    final queryResult = ApiQueryResult.fromMap(response);

    return RatedSong.fromJsonToList(queryResult.items).toList();
  }

  @override
  Future<List<FollowedArtist>> fetchFollowedArtistsList(
      int userID, FollowedArtistsListParams params) async {
    final response = await client.get(
      '/api/users/$userID/followedArtists',
      params: params.toJson(),
    );

    final queryResult = ApiQueryResult.fromMap(response);

    return FollowedArtist.fromJsonToList(queryResult.items).toList();
  }
}

final userApiRepositoryProvider =
    Provider.autoDispose<UserApiRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return UserApiRepository(client: apiClient);
});
