import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/main_picture_model.dart';

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

    test('should get list of tag model', () {
      const mockJson = {
        "tags": [
          {
            "count": 2,
            "tag": {"id": 1, "name": "tag_1"}
          },
          {
            "count": 3,
            "tag": {"id": 2, "name": "tag_2"}
          },
          {
            "count": 1,
            "tag": {"id": 3, "name": "tag_3"}
          }
        ],
      };
      AlbumModel result = AlbumModel.fromJson(mockJson);
      expect(result, isNotNull);
      expect(result.tags, isNotNull);
      expect(result.tags.length, 3);
    });

    test('should parse from entry correctly', () {
      MainPictureModel mockMainPictureModel = new MainPictureModel();
      mockMainPictureModel.urlThumb = 'https://picture.com';

      EntryModel mockEntryModel = new EntryModel();
      mockEntryModel.id = 1;
      mockEntryModel.name = 'album_1';
      mockEntryModel.artistString = 'artist_1';
      mockEntryModel.mainPicture = mockMainPictureModel;

      AlbumModel result = AlbumModel.fromEntry(mockEntryModel);
      expect(result.id, 1);
      expect(result.name, 'album_1');
      expect(result.artistString, 'artist_1');
      expect(result.mainPicture, mockMainPictureModel);
    });

    test('should not thrown exception when parse empty entry', () {
      AlbumModel result = AlbumModel.fromEntry(new EntryModel());
      expect(result, isNotNull);
    });
  });
}
