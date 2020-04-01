import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/user_model.dart';
import 'package:vocadb/services/user_service.dart';
import 'package:vocadb/services/web_service.dart';

class MockRestApi extends Mock implements RestApi {}

main() {
  final mockRestApi = MockRestApi();
  final service = UserRestService(restApi: mockRestApi);

  test('should return current user', () {
    final mockResult = {
      "active": true,
      "groupId": "Regular",
      "memberSince": "2013-12-06T07:20:14",
      "verifiedArtist": false,
      "id": 1065,
      "name": "up2up"
    };

    when(mockRestApi.get(any, any)).thenAnswer((_) => Future.value(mockResult));

    expect(service.getCurrent(), completion(isA<UserModel>()));
  });

  test('should return albums from user id', () {
    final mockResult = {
      'items': [
        {'id': 1, 'name': 'A'},
        {'id': 2, 'name': 'B'}
      ]
    };

    when(mockRestApi.get(any, any)).thenAnswer((_) => Future.value(mockResult));

    expect(service.albums(1), completion(isA<List<AlbumModel>>()));
  });
}
