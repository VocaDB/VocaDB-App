import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/models.dart';

void main() {
  group('Tag model', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "additionalNames": "electro-rock, electrorock",
        "categoryName": "Genres",
        "id": 2878,
        "name": "digital rock",
        "urlSlug": "digital-rock",
        "parent": {"id": 481, "name": "rock", "urlSlug": "rock"},
        "relatedTags": [
          {
            "id": 1655,
            "name": "progressive rock",
            "urlSlug": "progressive-rock"
          },
          {"id": 3251, "name": "new wave", "urlSlug": "new-wave"}
        ],
      };

      TagModel result = TagModel.fromJson(mockJson);
      expect(result.id, 2878);
      expect(result.name, "digital rock");
      expect(result.entryType, EntryType.Tag);
      expect(result.urlSlug, "digital-rock");
      expect(result.categoryName, "Genres");
      expect(result.additionalNames, "electro-rock, electrorock");
      expect(result.parent, isNotNull);
      expect(result.relatedTags, isNotNull);
      expect(result.relatedTags.length, 2);
    });

    test('should not thrown exception when input empty json', () {
      TagModel result = TagModel.fromJson({});
      expect(result, isNotNull);
    });
  });
}
