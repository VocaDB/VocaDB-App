import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/services/album_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class MockRestApi extends Mock implements RestApi {}

main() {
  final mockRestApi = MockRestApi();
  final service = AlbumRestService(restApi: mockRestApi);

  test('should return list of albums', () {
    final mockResult = {
      'items': [
        {'id': 1, 'name': 'A'},
        {'id': 2, 'name': 'B'}
      ]
    };

    when(mockRestApi.get(any, any)).thenAnswer((_) => Future.value(mockResult));

    expect(service.latest(), completion(isA<List<AlbumModel>>()));
    expect(service.top(), completion(isA<List<AlbumModel>>()));
    expect(service.latestByArtistId(1), completion(isA<List<AlbumModel>>()));
    expect(service.latestByTagId(1), completion(isA<List<AlbumModel>>()));
    expect(service.topByTagId(1), completion(isA<List<AlbumModel>>()));
  });

  test('should return album detail', () {
    when(mockRestApi.get(any, any)).thenAnswer((_) => Future.value({'id': 1, 'name': 'A'}));

    expect(service.byId(1), completion(isA<AlbumModel>()));
  });

}
