import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
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
  });
}
