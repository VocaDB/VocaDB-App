import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/albums/data/album_api_repository.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/domain/album_rate.dart';
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

    test('fetchAlbumID', () async {
      // Setup
      const responseBody = {"id": 1, "name": "test-album-ja"};

      // Mock
      when(() => client.get(any(), params: any(named: 'params', that: isMap)))
          .thenAnswer((_) => Future.value(responseBody));

      // Run
      final response = await albumApiRepository.fetchAlbumID(1);

      // Verify
      expect(response, Album(id: 1, name: 'test-album-ja'));
    });

    test('fetch top albums by tag ID', () async {
      when(() => client
              .get('/api/albums', params: any(named: 'params', that: isMap)))
          .thenAnswer((_) async => {
                'items': [
                  {'id': 1, 'name': 'Album_A'},
                  {'id': 2, 'name': 'Album_B'},
                ],
                'totalCount': 2,
              });

      final result = await albumApiRepository.fetchTopAlbumsByTagID(1);

      verify(() =>
          client.get('/api/albums', params: any(named: 'params', that: isMap)));
      expect(result, isA<List<Album>>());
      expect(result, isNotEmpty);
      expect(result, [
        Album(id: 1, name: 'Album_A'),
        Album(id: 2, name: 'Album_B'),
      ]);
    });

    test('fetch albums', () async {
      when(() => client
              .get('/api/albums', params: any(named: 'params', that: isMap)))
          .thenAnswer((_) async => {
                'items': [
                  {'id': 1, 'name': 'Album_A'},
                  {'id': 2, 'name': 'Album_B'},
                ],
                'totalCount': 2,
              });

      final result = await albumApiRepository.fetchAlbums();

      verify(() =>
          client.get('/api/albums', params: any(named: 'params', that: isMap)));
      expect(result, isA<List<Album>>());
      expect(result, isNotEmpty);
      expect(result, [
        Album(id: 1, name: 'Album_A'),
        Album(id: 2, name: 'Album_B'),
      ]);
    });

    test('rate album', () async {
      when(() => client.post('/api/current/albums/1', queryParams: {
            'mediaType': 'Ordered',
            'collectionStatus': 'Nothing',
            'rating': 5,
          })).thenAnswer((_) => Future.value(Response('OK', 200)));

      await albumApiRepository.rateAlbum(
        1,
        const AlbumRate(mediaType: 'Ordered', rating: 5),
      );
    });
  });
}
