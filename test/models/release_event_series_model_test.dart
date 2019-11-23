import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/release_event_series_model.dart';

void main() {
  group('Release event series model', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "additionalNames": "abc names",
        "category": "AlbumRelease",
        "description": "abc event",
        "id": 36,
        "name": "abc",
      };

      ReleaseEventSeriesModel result =
          ReleaseEventSeriesModel.fromJson(mockJson);
      expect(result.id, 36);
      expect(result.name, "abc");
      expect(result.entryType, EntryType.ReleaseEventSeries);
      expect(result.category, "AlbumRelease");
      expect(result.additionalNames, "abc names");
    });

    test('should not thrown exception when input empty json', () {
      ReleaseEventSeriesModel result = ReleaseEventSeriesModel.fromJson({});
      expect(result, isNotNull);
    });
  });
}
