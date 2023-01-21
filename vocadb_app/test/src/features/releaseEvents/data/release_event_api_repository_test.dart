import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_api_repository.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';

import '../../../mocks.dart';

void main() {
  group('releaseEventApiRepository', () {
    late ReleaseEventApiRepository releaseEventApiRepository;
    late ApiClient client;

    setUp(() {
      client = MockApiClient();
      releaseEventApiRepository = ReleaseEventApiRepository(client: client);
    });

    test('fetch release events list return success', () async {
      // Setup
      const responseBody = {
        'items': [
          {"id": 1, "name": "test-ja"},
          {"id": 2, "name": "test-ja-2"},
        ],
        'totalCount': 2,
      };

      when(() => client.get(any(), params: any(named: 'params', that: isMap)))
          .thenAnswer((_) => Future.value(responseBody));

      // Run
      final response = await releaseEventApiRepository.fetchReleaseEventsList();

      // Verify
      expect(response, [
        ReleaseEvent(id: 1, name: 'test-ja'),
        ReleaseEvent(id: 2, name: 'test-ja-2'),
      ]);
    });

    test('fetch recent release events list return success', () async {
      // Setup
      const responseBody = {
        'items': [
          {"id": 1, "name": "test-ja"},
          {"id": 2, "name": "test-ja-2"},
        ],
        'totalCount': 2,
      };

      when(() => client.get(any(), params: any(named: 'params', that: isMap)))
          .thenAnswer((_) => Future.value(responseBody));

      // Run
      final response = await releaseEventApiRepository.fetchRecentEvents();

      // Verify
      expect(response, [
        ReleaseEvent(id: 1, name: 'test-ja'),
        ReleaseEvent(id: 2, name: 'test-ja-2'),
      ]);
    });
  });
}
