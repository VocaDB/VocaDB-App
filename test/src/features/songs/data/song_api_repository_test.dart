import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/songs/data/song_api_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/domain/song_related.dart';

import '../../../mocks.dart';

void main() {
  group('songApiRepository', () {
    late SongApiRepository songApiRepository;
    late ApiClient client;

    setUp(() {
      client = MockApiClient();
      songApiRepository = SongApiRepository(client: client);
    });
    test('fetchSongsHighlighted return success', () async {
      // Setup
      const responseBody = [
        {"id": 1, "name": "test-ja"},
        {"id": 2, "name": "test-ja-2"},
      ];
      when(() => client.get(any(), params: any(named: 'params', that: isMap)))
          .thenAnswer((_) => Future.value(responseBody));

      // Run
      final response = await songApiRepository.fetchSongsHighlighted();

      // Verify
      expect(response, [
        const Song(id: 1, name: 'test-ja'),
        const Song(id: 2, name: 'test-ja-2'),
      ]);
    });

    test('fetchTopRated return success', () async {
      // Setup
      const responseBody = [
        {"id": 1, "name": "test-ja"},
        {"id": 2, "name": "test-ja-2"},
      ];
      when(() => client.get(any(), params: any(named: 'params', that: isMap)))
          .thenAnswer((_) => Future.value(responseBody));

      // Run
      final response =
          await songApiRepository.fetchSongsTopRated(durationHours: 24);

      // Verify
      expect(response, [
        const Song(id: 1, name: 'test-ja'),
        const Song(id: 2, name: 'test-ja-2'),
      ]);
    });

    test('fetchSongId return success', () async {
      // Setup
      const responseBody = {"id": 1};
      when(() => client.get('api/songs/1',
              params: any(named: 'params', that: isMap)))
          .thenAnswer((_) => Future.value(responseBody));

      // Run
      final response = await songApiRepository.fetchSongId(1);

      // Verify
      expect(
        response,
        const Song(id: 1),
      );
    });

    test('fetchSongsDerived return success', () async {
      // Setup
      const responseBody = [
        {"id": 1, "name": "test-ja"},
        {"id": 2, "name": "test-ja-2"},
      ];
      when(() => client.get('api/songs/1/derived',
              params: any(named: 'params', that: isMap)))
          .thenAnswer((_) => Future.value(responseBody));

      // Run
      final response = await songApiRepository.fetchSongsDerived(1);

      // Verify
      expect(
        response,
        [
          const Song(id: 1, name: 'test-ja'),
          const Song(id: 2, name: 'test-ja-2'),
        ],
      );
    });

    test('fetchSongsRelated return success', () async {
      // Setup
      const responseBody = {
        "likeMatches": [
          {"id": 1, "name": "test-ja"},
          {"id": 2, "name": "test-ja-2"},
        ],
      };
      when(() => client.get('api/songs/1/related',
              params: any(named: 'params', that: isMap)))
          .thenAnswer((_) => Future.value(responseBody));

      // Run
      final response = await songApiRepository.fetchSongsRelated(1);

      // Verify
      expect(
        response,
        const SongRelated(likeMatches: [
          Song(id: 1, name: 'test-ja'),
          Song(id: 2, name: 'test-ja-2'),
        ]),
      );
    });

    test('fetchSongs return success', () async {
      // Setup
      const responseBody = {
        "items": [
          {"id": 1, "name": "test-ja"},
          {"id": 2, "name": "test-ja-2"},
        ],
        "totalCount": 2,
      };
      when(() => client.get(any(), params: any(named: 'params', that: isMap)))
          .thenAnswer((_) => Future.value(responseBody));

      // Run
      final response = await songApiRepository.fetchSongsList();

      // Verify
      expect(response, [
        const Song(id: 1, name: 'test-ja'),
        const Song(id: 2, name: 'test-ja-2'),
      ]);
    });

    test('fetchTopSongsByTagID return success', () async {
      // Setup
      const responseBody = {
        "items": [
          {"id": 1, "name": "test-ja"},
          {"id": 2, "name": "test-ja-2"},
        ],
        "totalCount": 2,
      };
      when(() => client.get(any(), params: any(named: 'params', that: isMap)))
          .thenAnswer((_) => Future.value(responseBody));

      // Run
      final response = await songApiRepository.fetchTopSongsByTagID(1);

      // Verify
      expect(response, [
        const Song(id: 1, name: 'test-ja'),
        const Song(id: 2, name: 'test-ja-2'),
      ]);
    });
  });
}
