import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/pv.dart';
import 'package:vocadb/models/song.dart';

void main() {
  group('Song', () {
    test('should parse from json correctly', () {

      const mockJson = {
          "artistString": "n.k feat. v flower",
          "createDate": "2019-09-10T13:28:38.703",
          "defaultName": "オーレリア",
          "defaultNameLanguage": "Japanese",
          "favoritedTimes": 1,
          "id": 252751,
          "lengthSeconds": 276,
          "name": "オーレリア",
          "publishDate": "2019-09-10T00:00:00Z",
          "pvs": [
            {
              "author": "n.k",
              "disabled": false,
              "id": 361763,
              "length": 276,
              "name": "オーレリア／flower",
              "publishDate": "2019-09-10T00:00:00",
              "pvId": "sm35662254",
              "service": "NicoNicoDouga",
              "pvType": "Original",
              "thumbUrl": "http://nicovideo.cdn.nimg.jp/thumbnails/35662254/35662254.8661265",
              "url": "http://www.nicovideo.jp/watch/sm35662254"
            },
            {
              "author": "n.k music channel",
              "disabled": false,
              "id": 361785,
              "length": 277,
              "name": "オーレリア -Aurelia- / flower",
              "publishDate": "2019-09-10T00:00:00",
              "pvId": "A0R41lvORi0",
              "service": "Youtube",
              "pvType": "Original",
              "thumbUrl": "https://i.ytimg.com/vi/A0R41lvORi0/default.jpg",
              "url": "https://youtu.be/A0R41lvORi0"
            }
          ],
          "pvServices": "NicoNicoDouga, Youtube",
          "ratingScore": 9,
          "songType": "Original",
          "status": "Finished",
          "version": 4
        };

      Song result = Song.fromJson(mockJson);
      expect(result.id, 1);
      expect(result.name, "song1");
      expect(result.artistString, "test_artist");
      expect(result.pvs.length, 1);

      PV pv = result.pvs[0];
      expect(pv.id, 12);
      expect(pv.name, "abc");
      expect(pv.service, "youtube");
      expect(pv.url, "https://youtube.com/abc");
    });

    test('should not thrown exception when input empty json', () {
      Song result = Song.fromJson({});
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

      Song result = Song.fromJson(mockJson);
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

      Song result = Song.fromJson(mockJson);
      expect(result.pvs.length, 1);
      expect(result.youtubePV, isNull);
    });
  });
}
