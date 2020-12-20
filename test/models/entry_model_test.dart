import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/models.dart';

void main() {
  group('Entry model', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "id": 1,
        "entryType": "Song",
        "name": "song_1",
        "artistString": "artist_1",
        "artistType": "type_1",
        "mainPicture": {"urlThumb": "https://tn.smilevideo.jp"},
        "webLinks": [
          {
            "category": "Reference",
            "description": "MikuWiki",
            "id": 971,
            "url": "http://www5.atwiki.jp/hmiku/pages/4804.html"
          }
        ]
      };

      EntryModel result = EntryModel.fromJson(mockJson);
      expect(result.id, 1);
      expect(result.name, "song_1");
      expect(result.entryType, EntryType.Song);
      expect(result.artistString, "artist_1");
      expect(result.artistType, "type_1");
      expect(result.mainPicture, isNotNull);
      expect(result.webLinks, isNotNull);
      expect(result.webLinks.length, 1);
    });

    test('should not thrown exception when input empty json', () {
      EntryModel result = EntryModel.fromJson({});
      expect(result, isNotNull);
      expect(result.entryType, EntryType.Undefined);
    });
  });
}
