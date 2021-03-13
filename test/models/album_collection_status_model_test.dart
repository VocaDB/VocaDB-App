import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/models.dart';

void main() {
  group('Album collection status model', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "album": {
          "artistString": "Harry, Teruaki Tanahashi, ELS feat. Hatsune Miku",
          "id": 23848,
          "name": "A HUNDRED MILLION LIGHTS",
        },
        "mediaType": "Other",
        "purchaseStatus": "Wishlisted",
        "rating": 5
      };

      AlbumCollectionStatusModel result =
          AlbumCollectionStatusModel.fromJson(mockJson);
      expect(result.album.id, 23848);
      expect(result.mediaType, 'Other');
      expect(result.purchaseStatus, 'Wishlisted');
      expect(result.rating, 5);
    });

    test('should not thrown exception when input empty json', () {
      AlbumCollectionStatusModel result =
          AlbumCollectionStatusModel.fromJson({});
      expect(result, isNotNull);
      expect(result.album, isNull);
    });
  });
}
