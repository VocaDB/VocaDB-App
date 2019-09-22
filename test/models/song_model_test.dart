import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/main_picture_model.dart';
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
      expect(result.pvs, isNotNull);
      expect(result.pvs.length, 1);
      expect(result.artists, isNotNull);
      expect(result.artists.length, 2);
      expect(result.albums, isNotNull);
      expect(result.albums.length, 1);
      expect(result.producers.length, 1);
      expect(result.vocalists.length, 1);
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

    test('should parse from entry correctly', () {
      MainPictureModel mockMainPictureModel = new MainPictureModel();
      mockMainPictureModel.urlThumb = 'https://picture.com';

      EntryModel mockEntryModel = new EntryModel();
      mockEntryModel.id = 1;
      mockEntryModel.name = 'song_1';
      mockEntryModel.artistString = 'artist_1';
      mockEntryModel.mainPicture = mockMainPictureModel;

      SongModel result = SongModel.fromEntry(mockEntryModel);
      expect(result.id, 1);
      expect(result.name, 'song_1');
      expect(result.artistString, 'artist_1');
      expect(result.thumbUrl, 'https://picture.com');
    });

    test('should not thrown exception when parse empty entry', () {
      SongModel result = SongModel.fromEntry(new EntryModel());
      expect(result, isNotNull);
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
  });
}
