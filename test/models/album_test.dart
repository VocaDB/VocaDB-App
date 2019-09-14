import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/album_model.dart';

void main() {
  group('Album', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "id": 1,
        "name": "abc",
        "artistString": "def",
        "defaultName": "testname",
        "mainPicture": {
          "urlThumb": "https://i.ytimg.com/vi/iMZeB_yU_4s/default.jpg"
        },
        "tracks": [
          {"id": 1, "name": "defaultTrack"}
        ],
      };

      AlbumModel result = AlbumModel.fromJson(mockJson);
      expect(result.id, 1);
      expect(result.name, "abc");
      expect(result.artistString, "def");
      expect(result.defaultName, "testname");
      expect(result.mainPicture, isNotNull);
      expect(result.tracks, isNotNull);
    });

    test('should not thrown exception when input empty json', () {
      AlbumModel result = AlbumModel.fromJson({});
      expect(result, isNotNull);
      expect(result.mainPicture, isNull);
      expect(result.tracks, isNull);
    });
  });
}
