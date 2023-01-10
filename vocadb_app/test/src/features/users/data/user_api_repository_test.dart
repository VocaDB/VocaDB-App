import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/songs/domain/rated_song.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/users/data/request/rated_songs_list_params.dart';
import 'package:vocadb_app/src/features/users/data/user_api_repository.dart';

import '../../../mocks.dart';

void main() {
  group('userApiRepository', () {
    late UserApiRepository userApiRepository;
    late ApiClient client;

    setUp(() {
      client = MockApiClient();
      userApiRepository = UserApiRepository(client: client);
    });

    test('fetchRatedSongID success', () async {
      const userID = 1;
      const songID = 1;
      clientCallGet() =>
          client.get('/api/users/$userID/ratedSongs/$songID', json: false);

      when(clientCallGet).thenAnswer((_) => Future.value('Favorite'));

      final response = await userApiRepository.fetchRatedSongID(userID, songID);

      expect(response, 'Favorite');
    });

    test('fetchRatedSongsList success', () async {
      const userID = 1;
      const responseBody = {
        "items": [
          {
            "rating": "Favorite",
            "song": {"id": 1, "name": "Song_A"}
          },
          {
            "rating": "Like",
            "song": {"id": 2, "name": "Song_B"}
          }
        ],
        "totalCount": 2
      };
      final params = RatedSongsListParams(query: 'Song');

      clientCallGet() => client.get(
            '/api/users/$userID/ratedSongs',
            params: params.toJson(),
          );

      when(clientCallGet).thenAnswer((_) => Future.value(responseBody));

      final response = await userApiRepository.fetchRatedSongsList(
          userID, RatedSongsListParams(query: 'Song'));

      final expected = [
        RatedSong(rating: 'Favorite', song: const Song(id: 1, name: 'Song_A')),
        RatedSong(rating: 'Like', song: const Song(id: 2, name: 'Song_B'))
      ];

      expect(response, expected);

      verify(clientCallGet).called(1);
    });
  });
}
