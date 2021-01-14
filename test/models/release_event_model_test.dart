import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/models.dart';

void main() {
  group('ReleaseEvent', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "category": "Unspecified",
        "date": "2019-02-01T00:00:00Z",
        "description": "A song contest for Magical Mirai 2019.",
        "endDate": "2019-03-15T00:00:00Z",
        "id": 2507,
        "name": "「マジカルミライ」楽曲コンテスト 2019",
        "series": {
          "additionalNames": "abc names",
          "category": "AlbumRelease",
          "description": "abc event",
          "id": 1,
          "name": "abc",
        },
      };

      ReleaseEventModel result = ReleaseEventModel.fromJson(mockJson);
      expect(result.id, 2507);
      expect(result.name, "「マジカルミライ」楽曲コンテスト 2019");
      expect(result.description, "A song contest for Magical Mirai 2019.");
      expect(result.category, "Unspecified");
      expect(result.date, DateTime.parse("2019-02-01T00:00:00Z"));
      expect(result.endDate, DateTime.parse("2019-03-15T00:00:00Z"));
      expect(result.series, isNotNull);
      expect(result.displayCategory, 'AlbumRelease');
    });

    test('should not thrown exception when input empty json', () {
      ReleaseEventModel result = ReleaseEventModel.fromJson({});
      expect(result, isNotNull);
    });
  });
}
