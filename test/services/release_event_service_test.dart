import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/release_event_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class MockRestApi extends Mock implements RestApi {}

main() {
  final mockRestApi = MockRestApi();
  final service = ReleaseEventRestService(restApi: mockRestApi);

  test('should return list of releaseEvents', () {
    final mockResult = {
      'items': [
        {'id': 1, 'name': 'A'},
        {'id': 2, 'name': 'B'}
      ]
    };

    when(mockRestApi.get(any, any)).thenAnswer((_) => Future.value(mockResult));

    expect(service.latest(), completion(isA<List<ReleaseEventModel>>()));
    expect(service.bySeriesId(12), completion(isA<List<ReleaseEventModel>>()));
  });

  test('should return list of recently release events', () {
    final mockResult = {
      'items': [
        {'id': 1, 'name': 'A'},
        {'id': 2, 'name': 'B'}
      ]
    };

    when(mockRestApi.get(any, any)).thenAnswer((_) => Future.value(mockResult));

    expect(service.recently(), completion(isA<List<ReleaseEventModel>>()));

  });

  test('should return list of releaseEvents albums', () {
    final mockResult = {
      'items': [
        {'id': 1, 'name': 'A'},
        {'id': 2, 'name': 'B'}
      ]
    };

    when(mockRestApi.get(any, any)).thenAnswer((_) => Future.value(mockResult));

    expect(service.albums(1), completion(isA<List<AlbumModel>>()));
  });

  test('should return list of releaseEvents published songs', () {
    final mockResult = {
      'items': [
        {'id': 1, 'name': 'A'},
        {'id': 2, 'name': 'B'}
      ]
    };

    when(mockRestApi.get(any, any)).thenAnswer((_) => Future.value(mockResult));

    expect(service.publishedSongs(1), completion(isA<List<SongModel>>()));
  });

  test('should return releaseEvent detail', () {
    when(mockRestApi.get(any, any))
        .thenAnswer((_) => Future.value({'id': 1, 'name': 'A'}));

    expect(service.byId(1), completion(isA<ReleaseEventModel>()));
  });
}
