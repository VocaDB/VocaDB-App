import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/models.dart';

void main() {
  group('Tag group model', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "count": 2,
        "tag": {
          "additionalNames": "rock n roll",
          "categoryName": "Genres",
          "id": 481,
          "name": "rock",
          "urlSlug": "rock"
        }
      };

      TagGroupModel result = TagGroupModel.fromJson(mockJson);
      expect(result.count, 2);
      expect(result.tag, isNotNull);
    });

    test('should not thrown exception when input empty json', () {
      TagGroupModel result = TagGroupModel.fromJson({});
      expect(result, isNotNull);
      expect(result.tag, isNull);
    });
  });
}
