import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/constants/config.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/pvs/domain/pv.dart';
import 'package:vocadb_app/src/features/songs/domain/lyric.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

void main() {
  group('song.fromJson', () {
    test('parse json with all data success', () {
      const raw = '''
      {
        "id": 1,
        "name": "song_name",
        "artistString": "artist_name",
        "additionalNames": "add_name",
        "songType": "Original",
        "pvServices": "pv_services",
        "favoritedTimes": 5,
        "lengthSeconds": 120,
        "ratingScore": 5,
        "originalVersionId": 39,
        "thumbUrl": "thumb_url",
        "publishDate": "2007-08-31T00:00:00Z",
        "mainPicture": {
          "urlOriginal": "url_ori"
        },
        "lyrics": [
          {
            "id": 1
          }
        ],
        "artists": [
          {
            "id": 1,
            "name": "HatsuneMiku"
          }
        ],
        "pvs": [
          {
            "id": 13,
            "name": "Tripshots album",
            "service": "Youtube",
            "pvType": "Other",
            "url": "https://youtu.be/yhcvQhj5PVc"
          }
        ],
        "tags": [
          {
            "count": 10,
            "tag": {
              "id": 1
            }
          }
        ],
        "webLinks": [
          {
            "id": 1
          }
        ]
      }
      ''';
      final json = jsonDecode(raw);
      final expected = Song(
        id: 1,
        name: 'song_name',
        artistString: 'artist_name',
        additionalNames: 'add_name',
        songType: 'Original',
        pvServices: 'pv_services',
        favoritedTimes: 5,
        lengthSeconds: 120,
        ratingScore: 5,
        originalVersionId: 39,
        thumbUrl: 'thumb_url',
        publishDate: DateTime.parse('2007-08-31T00:00:00Z'),
        mainPicture: MainPicture(urlOriginal: 'url_ori'),
        lyrics: [Lyric(id: 1)],
        artists: [ArtistRole(id: 1, name: 'HatsuneMiku')],
        pvs: [
          PV(
              id: 13,
              name: 'Tripshots album',
              service: 'Youtube',
              pvType: 'Other',
              url: 'https://youtu.be/yhcvQhj5PVc')
        ],
        tags: [
          TagUsage(tag: Tag(id: 1), count: 10),
        ],
        webLinks: [
          const WebLink(id: 1),
        ],
      );

      expect(Song.fromJson(json), expected);
    });

    test('parse json without required data success', () {
      const raw = '''
      {
        "id": 1
      }
      ''';
      final json = jsonDecode(raw);
      const expected = Song(id: 1);

      expect(Song.fromJson(json), expected);
    });

    group('song.imageUrl', () {
      test('from thumbUrl by default', () {
        const song = Song(id: 1, thumbUrl: 'http://example.com/thumb1.jpg');
        expect(song.imageUrl, song.thumbUrl);
      });

      test('from mainPicture.urlOriginal when thumbUrl not exist', () {
        final mainPicture =
            MainPicture(urlOriginal: 'http://example.com/thumb1.jpg');
        final song = Song(
          id: 1,
          mainPicture: mainPicture,
        );
        expect(song.imageUrl, mainPicture.urlOriginal);
      });

      test(
          'with default placeholder when thumbUrl not exist and mainPicutre.urlOriginal not exist',
          () {
        final mainPicture =
            MainPicture(urlSmallThumb: 'http://example.com/thumb1.jpg');
        final song = Song(
          id: 1,
          mainPicture: mainPicture,
        );
        expect(song.imageUrl, kPlaceholderImageUrl);
      });
      test(
          'with default placeholder when thumbUrl and mainPicture are not exist',
          () {
        const song = Song(id: 1);
        expect(song.imageUrl, kPlaceholderImageUrl);
      });
    });
  });

  group('song.youtubeUrl', () {
    test('Test get youtube url when have both reprint and original in PV list', () {
      expect(Song(
        id: 1,
        pvs: [
          PV(id: 1, name: 'A', service: 'Youtube', pvType: 'Reprint', url: 'https://youtube.com/watch?v=A'),
          PV(id: 2, name: 'B', service: 'Youtube', pvType: 'Original', url: 'https://youtube.com/watch?v=B'),
          PV(id: 3, name: 'C', service: 'Soundcloud', pvType: 'Reprint', url: 'https://youtube.com/watch?v=C'),
          PV(id: 4, name: 'D', service: 'BB', pvType: 'Original', url: 'https://youtube.com/watch?v=D'),
        ]
      ).youtubeUrl,'https://youtube.com/watch?v=B');
    });

    test('Test get youtube url as null when pvs list is empty', () {
      expect(const Song(id: 1).youtubeUrl, isNull);
    });

    test('Test get youtube url as null when no youtube pv', () {
      expect(Song(id: 1,
      pvs: [
          PV(id: 3, name: 'C', service: 'Soundcloud', pvType: 'Reprint', url: 'https://youtube.com/watch?v=C'),
      ]).youtubeUrl, isNull);
    });

    test('Test get youtube url when contain youtube pv but no original type', () {
      expect(Song(id: 1,
      pvs: [
          PV(id: 1, name: 'A', service: 'Youtube', pvType: 'Reprint', url: 'https://youtube.com/watch?v=A'),
      ]).youtubeUrl, 'https://youtube.com/watch?v=A');
    });

    test('Test get youtube url when contain multiple original youtube url', () {
      expect(Song(id: 1,
      pvs: [
          PV(id: 1, name: 'A', service: 'Youtube', pvType: 'Original', url: 'https://youtube.com/watch?v=A'),
          PV(id: 2, name: 'B', service: 'Youtube', pvType: 'Original', url: 'https://youtube.com/watch?v=B'),
      ]).youtubeUrl, 'https://youtube.com/watch?v=A');
    });

    test('Test get youtube url when contain multiple reprint youtube url', () {
      expect(Song(id: 1,
      pvs: [
          PV(id: 1, name: 'A', service: 'Youtube', pvType: 'Reprint', url: 'https://youtube.com/watch?v=A'),
          PV(id: 2, name: 'B', service: 'Youtube', pvType: 'Reprint', url: 'https://youtube.com/watch?v=B'),
      ]).youtubeUrl, 'https://youtube.com/watch?v=A');
    });

    test('Test get youtube url when contain multiple youtube url', () {
      expect(Song(id: 1,
      pvs: [
          PV(id: 1, name: 'A', service: 'Youtube', pvType: 'Reprint', url: 'https://youtube.com/watch?v=A'),
          PV(id: 2, name: 'B', service: 'Youtube', pvType: 'Original', url: 'https://youtube.com/watch?v=B'),
          PV(id: 3, name: 'C', service: 'Youtube', pvType: 'Reprint', url: 'https://youtube.com/watch?v=C'),
          PV(id: 4, name: 'D', service: 'Youtube', pvType: 'Original', url: 'https://youtube.com/watch?v=D'),
      ]).youtubeUrl, 'https://youtube.com/watch?v=B');
    });
  });
}

