import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/domain/disc.dart';
import 'package:vocadb_app/src/features/albums/domain/release_date.dart';
import 'package:vocadb_app/src/features/albums/domain/track.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/pvs/domain/pv.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

void main() {
  group('album', () {
    test('parse json with all data', () {
      const raw = '''
      {
        "id": 1,
        "name": "synthesis",
        "artistString": "Tripshots",
        "discType": "Album",
        "catalogNumber": "KRHS-90035",
        "description": "",
        "discs": [{"id": 1},{"id": 2}],
        "mainPicture": {
          "urlOriginal": "https://vocadb.net/Album/CoverPicture/1"
        },
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
        "ratingAverage": 1.22,
        "ratingCount": 3,
        "releaseDate": {
          "day": 11,
          "formatted": "6/11/2009",
          "month": 6,
          "year": 2009
        },
        "tags": [
          {
            "count": 1,
            "tag": {
              "id": 93,
              "name": "digital"
            }
          }
        ],
        "tracks": [
          {
            "id": 3005,
            "name": "anger [Extend-RMX]",
            "discNumber": 1,
            "trackNumber": 1,
            "song": {
              "id": 1766,
              "name": "anger [Extend-RMX]"
            }
          }
        ],
        "webLinks": [
          {
            "id": 1182,
            "description": "MikuWiki",
            "category": "Reference"
          }
        ]
      }
      ''';
      final json = jsonDecode(raw);
      final expected = Album(
        id: 1,
        name: "synthesis",
        artistString: "Tripshots",
        discType: "Album",
        catalogNumber: "KRHS-90035",
        description: "",
        discs: [
          Disc(id: 1),
          Disc(id: 2),
        ],
        mainPicture: MainPicture(
          urlOriginal: 'https://vocadb.net/Album/CoverPicture/1',
        ),
        artists: [
          ArtistRole(
            id: 1,
            name: 'HatsuneMiku',
          ),
        ],
        pvs: [
          PV(
            id: 13,
            name: "Tripshots album",
            service: "Youtube",
            pvType: "Other",
            url: "https://youtu.be/yhcvQhj5PVc",
          )
        ],
        ratingAverage: 1.22,
        ratingCount: 3,
        releaseDate: ReleaseDate(
          day: 11,
          formatted: "6/11/2009",
          month: 6,
          year: 2009,
        ),
        tags: [
          TagUsage(
            count: 1,
            tag: Tag(
              id: 93,
              name: 'digital',
            ),
          ),
        ],
        tracks: [
          Track(
            id: 3005,
            discNumber: 1,
            trackNumber: 1,
            name: 'anger [Extend-RMX]',
            song: const Song(
              id: 1766,
              name: 'anger [Extend-RMX]',
            ),
          )
        ],
        webLinks: [
          const WebLink(
            id: 1182,
            description: 'MikuWiki',
            category: 'Reference',
          ),
        ],
      );

      expect(Album.fromJson(json), expected);
    });

    test('parse json with empty data success', () {
      const raw = '{"id": 1}';
      final json = jsonDecode(raw);
      final expected = Album(id: 1);

      expect(Album.fromJson(json), expected);
    });
  });
}
