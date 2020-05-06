import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/models.dart';

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
        "artists": [
          {
            "artist": {
              "additionalNames": "OkameP, かるび太郎, Calvi Taro",
              "artistType": "Producer",
              "id": 87,
              "name": "オカメP",
            },
            "categories": "Producer",
            "effectiveRoles": "Default",
            "name": "オカメP",
            "roles": "Default"
          },
          {
            "artist": {
              "additionalNames": "Hatsune Miku",
              "artistType": "Vocaloid",
              "id": 1,
              "name": "初音ミク",
              "status": "Locked",
            },
            "categories": "Vocalist",
            "effectiveRoles": "Default",
            "name": "初音ミク",
            "roles": "Default"
          },
        ],
        "catalogNumber": "KRHS-90072",
        "tracks": [
          {"id": 1, "name": "defaultTrack"}
        ],
        "description": "abc",
        "ratingAverage": 4.33,
        "ratingCount": 3,
        "releaseDate": {
          "day": 18,
          "formatted": "9/18/2019",
          "month": 9,
          "year": 2019
        }
      };

      AlbumModel result = AlbumModel.fromJson(mockJson);
      expect(result.id, 1);
      expect(result.name, "abc");
      expect(result.entryType, EntryType.Album);
      expect(result.artistString, "def");
      expect(result.defaultName, "testname");
      expect(result.mainPicture, isNotNull);
      expect(result.tracks, isNotNull);
      expect(result.releaseDate, isNotNull);
      expect(result.artists, isNotNull);
      expect(result.artists.length, 2);
      expect(result.ratingAverage, 4.33);
      expect(result.ratingCount, 3);
      expect(result.catalogNumber, "KRHS-90072");
    });

    test('should not thrown exception when input empty json', () {
      AlbumModel result = AlbumModel.fromJson({});
      expect(result, isNotNull);
      expect(result.mainPicture, isNull);
      expect(result.tracks, isEmpty);
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

    test('should get sorted discs', () {
      const mockDiscs = {
        "tracks": [
          {"discNumber": 1, "trackNumber": 2, "name": "12"},
          {"discNumber": 3, "trackNumber": 1, "name": "31"},
          {"discNumber": 3, "trackNumber": 2, "name": "32"},
          {"discNumber": 2, "trackNumber": 1, "name": "21"},
          {"discNumber": 1, "trackNumber": 1, "name": "11"}
        ],
      };

      AlbumModel result = AlbumModel.fromJson(mockDiscs);

      List<AlbumDiscModel> discs = result.discs();

      expect(discs, isNotNull);
      expect(discs.length, 3);
      expect(discs[0].discNumber, 1);
      expect(discs[1].discNumber, 2);
      expect(discs[2].discNumber, 3);
    });
  });
}
