import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/pvs/domain/pv.dart';
import 'package:vocadb_app/src/features/songs/domain/lyric.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

void main() {
  group('song', () {
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
  });
}
