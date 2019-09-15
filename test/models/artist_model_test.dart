import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/artist_model.dart';

void main() {
  group('Artist model', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "additionalNames": "Hatsune Miku",
        "artistType": "Vocaloid",
        "id": 1,
        "name": "初音ミク",
      };

      ArtistModel result = ArtistModel.fromJson(mockJson);
      expect(result.id, 1);
      expect(result.name, "初音ミク");
      expect(result.artistType, "Vocaloid");
      expect(result.additionalNames, "Hatsune Miku");
    });

    test('should not thrown exception when input empty json', () {
      ArtistModel result = ArtistModel.fromJson({});
      expect(result, isNotNull);
    });
  });
}
