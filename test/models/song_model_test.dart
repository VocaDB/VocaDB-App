import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/song_model.dart';

void main() {
  group('Song model', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "id": 1,
        "name": "song1",
        "artistString": "test_artist",
        "originalVersionId": 2,
        "songType": "Original",
        "publishDate": "2009-08-19T00:00:00Z",
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
        "lyrics": [
          {"id": 548, "translationType": "Original", "value": "ja_lyric"},
          {"id": 2798, "translationType": "Romanized", "value": "ro_lyric"},
        ],
        "albums": [
          {
            "additionalNames": "Romeo to Cinderella, Romeo and Cinderella",
            "id": 17,
            "name": "ロミオとシンデレラ",
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
      expect(result.entryType, EntryType.Song);
      expect(result.songType, 'Original');
      expect(result.originalVersionId, 2);
      expect(result.publishDate, '2009-08-19T00:00:00Z');
      expect(result.pvs, isNotNull);
      expect(result.pvs.length, 1);
      expect(result.artists, isNotNull);
      expect(result.artists.length, 2);
      expect(result.albums, isNotNull);
      expect(result.albums.length, 1);
      expect(result.producers.length, 1);
      expect(result.vocalists.length, 1);
      expect(result.publishDateFormatted, '2009-08-19');
      expect(result.lyrics.length, 2);
    });

    test('should not thrown exception when input empty json', () {
      SongModel result = SongModel.fromJson({});
      expect(result, isNotNull);
      expect(result.pvs, isEmpty);
      expect(result.artists, isEmpty);
      expect(result.albums, isEmpty);
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

  group('Song list', () {
    List<SongModel> songs = [
      SongModel.fromJson({
        "id": 1,
        "name": "A",
        "pvs": [
          {"id": 1, "service": "NicoNico"}
        ]
      }),
      SongModel.fromJson({
        "id": 2,
        "name": "B",
        "pvs": [
          {"id": 1, "service": "Youtube"}
        ]
      }),
      SongModel.fromJson({
        "id": 3,
        "name": "C",
        "pvs": [
          {"id": 2, "service": "SoundCloud"}
        ]
      }),
      SongModel.fromJson({
        "id": 4,
        "name": "D",
        "pvs": [
          {"id": 2, "service": "Youtube"}
        ]
      }),
      SongModel.fromJson({
        "id": 5,
        "name": "E",
        "pvs": [
          {"id": 1, "service": "SomeService"}
        ]
      }),
      SongModel.fromJson({
        "id": 6,
        "name": "E",
        "pvs": [
          {"id": 1, "service": "SomeService2"}
        ]
      }),
    ];

    SongList songList;

    setUp(() {
      songList = SongList(songs);
    });

    test('should return song with youtube pv', () {
      SongModel songWithYoutubePV = songList.getFirstWithYoutubePV();

      expect(songWithYoutubePV, isNotNull);
      expect(songWithYoutubePV.id, 2);

      songWithYoutubePV = songList.getFirstWithYoutubePV(start: 1);

      expect(songWithYoutubePV, isNotNull);
      expect(songWithYoutubePV.id, 2);
    });

    test('should return null when youtube pv not found from specific index',
        () {
      SongModel songWithYoutubePV = songList.getFirstWithYoutubePV(start: 4);

      expect(songWithYoutubePV, isNull);
    });

    test('should return json correctly', () {
      const mockJson = {
        "id": 1,
        "name": "song1",
        "artistString": "test_artist",
        "songType": "Original",
        "mainPicture": {"urlThumb": "https://image.com"},
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

      expect(result, isNotNull);

      Map<String, dynamic> jsonResult = result.toJson();
      expect(jsonResult['id'], 1);
      expect(jsonResult['name'], 'song1');
      expect(jsonResult['artistString'], 'test_artist');
      expect(jsonResult['songType'], 'Original');
      expect(jsonResult['pvs'], isNotNull);
      expect(jsonResult['mainPicture'], isNotNull);
    });
  });
}
