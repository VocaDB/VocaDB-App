import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class MockHttpService extends Mock implements HttpService {}

void main() {
  test('should return AlbumCollectionStatusModel', () async {
    final Map<String, dynamic> mockResponse = {
      "album": {
        "artistString": "Harry, Teruaki Tanahashi, ELS feat. Hatsune Miku",
        "id": 23848,
        "name": "A HUNDRED MILLION LIGHTS",
      },
      "mediaType": "Other",
      "purchaseStatus": "Wishlisted",
      "rating": 5
    };
    final MockHttpService mockHttpService = MockHttpService();
    final UserRepository userRepository =
        UserRepository(httpService: mockHttpService);
    final AlbumCollectionStatusModel expectModel =
        AlbumCollectionStatusModel.fromJson(mockResponse);
    final String url = '/api/users/current/album-collection-statuses/1';

    when(mockHttpService.get(url, null))
        .thenAnswer((_) => Future.value(mockResponse));

    final AlbumCollectionStatusModel actualModel =
        await userRepository.getCurrentUserAlbumCollection(1);

    expect(actualModel.album.id, expectModel.album.id);
    expect(actualModel.mediaType, expectModel.mediaType);
    expect(actualModel.purchaseStatus, expectModel.purchaseStatus);
    expect(actualModel.rating, expectModel.rating);
  });
}
