import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/tag_model.dart';

void main() {
  group('Tag model', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "additionalNames": "rock n roll",
        "categoryName": "Genres",
        "id": 481,
        "name": "rock",
        "urlSlug": "rock"
      };

      TagModel result = TagModel.fromJson(mockJson);
      expect(result.id, 481);
      expect(result.name, "rock");
      expect(result.entryType, EntryType.Tag);
      expect(result.urlSlug, "rock");
      expect(result.categoryName, "Genres");
      expect(result.additionalNames, "rock n roll");
    });

    test('should not thrown exception when input empty json', () {
      TagModel result = TagModel.fromJson({});
      expect(result, isNotNull);
    });
  });
}
