import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/services/album_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class MockRestApi extends Mock implements RestApi {}

main() {
  final mcckRestApi = MockRestApi();
  final service = AlbumRestService(restApi: mcckRestApi);

  test('should return list of albums when get latest albums', () {
    final mockResult = {
      'items': [
        {'id': 1, 'name': 'A'},
        {'id': 2, 'name': 'B'}
      ]
    };

    when(mcckRestApi.get(any, any)).thenAnswer((_) => Future.value(mockResult));

    expect(service.latest(), completion(isA<List<AlbumModel>>()));
  });

  test('should return list of albums when get top albums', () {
    final mockResult = {
      'items': [
        {'id': 1, 'name': 'A'},
        {'id': 2, 'name': 'B'}
      ]
    };

    when(mcckRestApi.get(any, any)).thenAnswer((_) => Future.value(mockResult));

    expect(service.top(), completion(isA<List<AlbumModel>>()));
  });
}
