import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/domain/release_event.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/domain/release_event_series.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

void main() {
  group('release_event_series', () {
    test('parse json with all data', () {
      const raw = '''
      {
        "id": 1,
        "name": "event_name",
        "additionalNames": "add_name",
        "description": "desc",
        "category": "cat",
        "events": [
          {
            "id": 1
          }
        ],
        "mainPicture": {
          "urlOriginal": "urlOri"
        },
        "webLinks": [
          {
            "id": 1
          }
        ]
      }
      ''';
      final json = jsonDecode(raw);
      final expected = ReleaseEventSeries(
          id: 1,
          name: 'event_name',
          additionalNames: 'add_name',
          description: 'desc',
          category: 'cat',
          events: [
            ReleaseEvent(
              id: 1,
            ),
          ],
          mainPicture: MainPicture(urlOriginal: 'urlOri'),
          webLinks: [
            const WebLink(
              id: 1,
            ),
          ]);

      expect(ReleaseEventSeries.fromJson(json), expected);
    });

    test('parse json withony required data', () {
      const raw = '''
      {
        "id": 1
      }
      ''';
      final json = jsonDecode(raw);
      final expected = ReleaseEventSeries(id: 1);

      expect(ReleaseEventSeries.fromJson(json), expected);
    });
  });
}
