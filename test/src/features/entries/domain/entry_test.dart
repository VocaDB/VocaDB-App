import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/entries/domain/entry.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

void main() {
  group('entry', () {
    test('parse json with all data', () {
      const raw = '''
      {
        "id": 1,
        "entryType": "Song",
        "additionalNames": "add_name",
        "defaultName": "default_name",
        "name": "entry_name",
        "artistString": "artist_name",
        "artistType": "Vocaloid",
        "songType": "Original",
        "discType": "Album",
        "eventCategory": "Contest",
        "activityDate": "2022-01-10T00:00:00Z",
        "mainPicture": {
          "urlOriginal": "url_ori"
        },
        "tags": [
          {
            "count": 10,
            "tag": {
              "id": 1
            }
          },
          {
            "count": 11,
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
      final expected = Entry(
        id: 1,
        entryType: 'Song',
        additionalNames: 'add_name',
        defaultName: 'default_name',
        name: 'entry_name',
        artistString: 'artist_name',
        artistType: 'Vocaloid',
        songType: 'Original',
        discType: 'Album',
        eventCategory: 'Contest',
        activityDate: DateTime.parse('2022-01-10T00:00:00Z'),
        mainPicture: MainPicture(urlOriginal: 'url_ori'),
        tags: [
          TagUsage(tag: Tag(id: 1), count: 10),
          TagUsage(tag: Tag(id: 2), count: 11),
        ],
        webLinks: [
          const WebLink(id: 1),
          const WebLink(id: 2),
        ],
      );

      expect(Entry.fromJson(json), expected);
    });

    test('parse json without required data success', () {
      const raw = '''
      {
        "id": 1,
        "entryType": "Song"
      }
      ''';
      final json = jsonDecode(raw);
      final expected = Entry(
        id: 1,
        entryType: 'Song',
      );

      expect(Entry.fromJson(json), expected);
    });
  });
}
