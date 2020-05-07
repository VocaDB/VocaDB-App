import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/models/models.dart';
import 'package:vocadb/parameters/parameters.dart';
import 'package:vocadb/repositories/repositories.dart';

class MockApiClient extends Mock implements VocaDBApiClient {}

void main() {
  group('assertion', () {
    test('should assert if null', () {
      expect(
        () => SongRepository(apiClient: null),
        throwsA(isAssertionError),
      );
    });
  });

  group('findAll', () {
    final mockApiClient = MockApiClient();
    final mockSongRepository = SongRepository(apiClient: mockApiClient);

    test('should return list of songs', () async {
      final mockResponseData = {
        'items': [
          {'id': 1, 'name': 'A'},
          {'id': 2, 'name': 'B'}
        ],
        'totalCount': 2
      };

      when(mockApiClient.get(any, any))
          .thenAnswer((_) => Future.value(mockResponseData));

      expect(await mockSongRepository.findAll(), isList);
    });

    test('should return list of songs when add parameter', () async {
      final mockResponseData = {
        'items': [
          {'id': 1, 'name': 'A'}
        ],
        'totalCount': 1
      };

      when(mockApiClient.get(any, any))
          .thenAnswer((_) => Future.value(mockResponseData));

      expect(
          await mockSongRepository.findAll(
              parameter: SongParameter(query: 'A')),
          isList);
    });
  });

  group('findById', () {
    final mockApiClient = MockApiClient();
    final mockSongRepository = SongRepository(apiClient: mockApiClient);

    test('should return song', () async {
      final mockResponseData = {'id': 1, 'name': 'A'};

      when(mockApiClient.get(any, any))
          .thenAnswer((_) => Future.value(mockResponseData));

      expect(await mockSongRepository.findById(1), isA<SongModel>());
    });

    test('should return song when add parameter', () async {
      final mockResponseData = {'id': 1, 'name': 'A'};

      when(mockApiClient.get(any, any))
          .thenAnswer((_) => Future.value(mockResponseData));

      expect(
          await mockSongRepository.findById(1,
              parameter: SongParameter(lang: 'Default')),
          isA<SongModel>());
    });
  });
}
