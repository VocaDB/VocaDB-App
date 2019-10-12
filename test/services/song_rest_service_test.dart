import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/song_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class MockRestService extends Mock implements RestApi {}

main() {
  final mockApi = MockRestService();
  final service = SongRestService(restApi: mockApi);

  test('should return list of songs when get highlighted songs', () {
    final mockResult = {
      'items': [
        {'id': 1, 'name': 'A'},
        {'id': 2, 'name': 'B'}
      ]
    };

    when(mockApi.get(any, any)).thenAnswer((_) => Future.value(mockResult));

    expect(service.highlighted(), completion(isA<List<SongModel>>()));
  });

  test('should return list of songs when get related songs', () {
    final mockResult = {
      'artistMatches': [],
      'likeMatches': [
        {
          "artistString": "とくP feat. 初音ミク",
          "id": 1723,
          "name": "ARiA",
          "songType": "Original",
        }
      ],
      'tagMatches': [],
    };

    when(mockApi.get(any, any)).thenAnswer((_) => Future.value(mockResult));

    expect(service.related(1), completion(isA<List<SongModel>>()));
  });

  test('should return empty list when get related songs and not likeMatches field', () {
    final mockResult = {
      'artistMatches': [],
      'tagMatches': [],
    };

    when(mockApi.get(any, any)).thenAnswer((_) => Future.value(mockResult));

    expect(service.related(1), completion(isA<List<SongModel>>()));
  });

  test('should return list of songs when get derived songs', () {
    final mockResult = [
      {
        "artistString": "salanos feat. 初音ミク",
        "id": 2896,
        "name": "ロミオとシンデレラ - livemix",
      },
      {
        "artistString": "THE 39's feat. 初音ミク",
        "id": 5493,
        "name": "ロミオとシンデレラ [Live]",
      }
  ];

    when(mockApi.get(any, any)).thenAnswer((_) => Future.value(mockResult));

    expect(service.derived(1), completion(isA<List<SongModel>>()));
  });
}
