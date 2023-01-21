import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event_series.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

void main() {
  group('release_event', () {
    test('parse json with all data', () {
      const raw =
          '''
      {
        "id": 1,
        "name": "event_name",
        "additionalNames": "add_name",
        "description": "desc",
        "date": "2022-11-27T00:00:00Z",
        "endDate": "2022-10-31T00:00:00Z",
        "category": "cat",
        "venueName": "venue",
        "mainPicture": {
          "urlOriginal": "urlOri"
        },
        "artists": [
          {
            "name": "a1"
          }
        ],
        "series": {
            "id": 1
        },
        "tags": [
          {
            "count": 3,
            "tag": {
              "id": 1
            }
          },
          {
            "count": 4,
            "tag": {
              "id": 2
            }
          }
        ],
        "webLinks": [
          {
            "id": 1
          },
          {
            "id": 2
          }
        ]

      }
      ''';
      final json = jsonDecode(raw);
      final expected = ReleaseEvent(
        id: 1,
        name: 'event_name',
        additionalNames: 'add_name',
        description: 'desc',
        date: DateTime.parse('2022-11-27T00:00:00Z'),
        endDate: DateTime.parse('2022-10-31T00:00:00Z'),
        category: 'cat',
        venueName: 'venue',
        mainPicture: MainPicture(urlOriginal: 'urlOri'),
        artists: [
          ArtistRole(name: 'a1'),
        ],
        series: ReleaseEventSeries(id: 1),
        tags: [
          TagUsage(tag: Tag(id: 1), count: 3),
          TagUsage(tag: Tag(id: 2), count: 4)
        ],
        webLinks: [
          const WebLink(id: 1),
          const WebLink(id: 2),
        ],
      );

      expect(ReleaseEvent.fromJson(json), expected);
    });

    test('parse json without required data', () {
      const raw = '''
      {
        "id": 1
      }
      ''';
      final json = jsonDecode(raw);
      final expected = ReleaseEvent(id: 1);

      expect(ReleaseEvent.fromJson(json), expected);
    });
  });
}
