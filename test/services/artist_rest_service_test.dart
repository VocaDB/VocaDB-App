import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/services/artist_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class MockRestService extends Mock implements RestApi {}

main() {
  final mockApi = MockRestService();
  final service = ArtistRestService(restApi: mockApi);

  test('should return list of artists when searched', () {
    final mockResult = {
      'items': [
        {'id': 1, 'name': 'A'},
        {'id': 2, 'name': 'B'}
      ]
    };

    when(mockApi.get(any, any)).thenAnswer((_) => Future.value(mockResult));

    expect(service.search('miku'), completion(isA<List<ArtistModel>>()));
  });

  test('should return artist detail', () {
    when(mockApi.get(any, any)).thenAnswer((_) => Future.value({'id': 1, 'name': 'A'}));

    expect(service.byId(1), completion(isA<ArtistModel>()));
  });
}
