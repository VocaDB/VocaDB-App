import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/entry_model.dart';

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
      };

      EntryModel result = EntryModel.fromJson(mockJson);
      expect(result.id, 1);
      expect(result.name, "song_1");
      expect(result.entryType, EntryType.Song);
      expect(result.artistString, "artist_1");
      expect(result.artistType, "type_1");
      expect(result.mainPicture, isNotNull);
    });

    test('should not thrown exception when input empty json', () {
      EntryModel result = EntryModel.fromJson({});
      expect(result, isNotNull);
      expect(result.entryType, EntryType.Undefined);
    });
  });
}
