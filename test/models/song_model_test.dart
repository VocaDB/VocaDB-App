import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/song_model.dart';

void main() {
  group('Song model', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "id": 1,
        "name": "song1",
        "artistString": "test_artist",
        "artists": [
          {
            "categories": "Producer",
            "effectiveRoles": "Default",
            "id": 917,
            "name": "doriko",
            "roles": "Default"
          },
          {
            "categories": "Vocalist",
            "effectiveRoles": "Default",
            "id": 918,
            "name": "初音ミク",
            "roles": "Default"
          },
        ],
        "pvs": [
          {
            "id": 12,
            "name": "abc",
            "service": "youtube",
            "url": "https://youtube.com/abc"
          }
        ],
      };

      SongModel result = SongModel.fromJson(mockJson);
      expect(result.id, 1);
      expect(result.name, "song1");
      expect(result.artistString, "test_artist");
      expect(result.pvs, isNotNull);
      expect(result.pvs.length, 1);
      expect(result.artists, isNotNull);
      expect(result.artists.length, 2);
    });

    test('should not thrown exception when input empty json', () {
      SongModel result = SongModel.fromJson({});
      expect(result, isNotNull);
    });

    test('should return youtube url when youtube pv is exists', () {
      const mockJson = {
        "pvs": [
          {
            "id": 1,
            "name": "abc",
            "service": "niconico",
            "url": "https://some_niconico_url"
          },
          {
            "id": 2,
            "name": "def",
            "service": "youtube",
            "url": "https://youtube.com/abc"
          }
        ]
      };

      SongModel result = SongModel.fromJson(mockJson);
      expect(result.pvs.length, 2);
      expect(result.youtubePV, isNotNull);
      expect(result.youtubePV.url, 'https://youtube.com/abc');
    });

    test('should return null when youtube pv is not exists', () {
      const mockJson = {
        "pvs": [
          {
            "id": 1,
            "name": "abc",
            "service": "niconico",
            "url": "https://some_niconico_url"
          }
        ]
      };

      SongModel result = SongModel.fromJson(mockJson);
      expect(result.pvs.length, 1);
      expect(result.youtubePV, isNull);
    });
  });
}
