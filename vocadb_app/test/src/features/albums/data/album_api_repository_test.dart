import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/albums/data/album_api_repository.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';

import '../../../mocks.dart';

void main() {
  group('albumApiRepository', () {
    late AlbumApiRepository albumApiRepository;
    late ApiClient client;

    setUp(() {
      client = MockApiClient();
      albumApiRepository = AlbumApiRepository(client: client);
    });

    test('fetchNew return success', () async {
      // Setup
      const responseBody = [
        {"id": 1, "name": "test-ja"},
        {"id": 2, "name": "test-ja-2"},
      ];
      when(() => client.get(any(), params: any(named: 'params', that: isMap)))
          .thenAnswer((_) => Future.value(responseBody));

      // Run
      final response = await albumApiRepository.fetchNew();

      // Verify
      expect(response, [
        Album(id: 1, name: 'test-ja'),
        Album(id: 2, name: 'test-ja-2'),
      ]);
    });

    test('fetchTop return success', () async {
      // Setup
      const responseBody = [
        {"id": 1, "name": "test-ja"},
        {"id": 2, "name": "test-ja-2"},
      ];
      when(() => client.get(any(), params: any(named: 'params', that: isMap)))
          .thenAnswer((_) => Future.value(responseBody));

      // Run
      final response = await albumApiRepository.fetchTop();

      // Verify
      expect(response, [
        Album(id: 1, name: 'test-ja'),
        Album(id: 2, name: 'test-ja-2'),
      ]);
    });
  });
}
