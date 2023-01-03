import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

void main() {
  group('tag', () {
    test('parse json with all data', () {
      const raw = '''
      {
        "id": 1,
        "name": "tag_name",
        "categoryName": "cat_name",
        "description": "desc",
        "mainPicture": {
          "urlOriginal": "mainPicture_url"
        },
        "parent": {
          "id": 2,
          "name": "parent"
        },
        "relatedTags": [
          {
            "id": 3,
            "name": "tag_3"
          },
          {
            "id": 4,
            "name": "tag_4"
          }
        ],
        "usageCount": 10,
        "webLinks": [
          {
            "id": 1
          }
        ]
      }
      ''';
      final json = jsonDecode(raw);
      final expected = Tag(
        id: 1,
        name: 'tag_name',
        categoryName: 'cat_name',
        description: 'desc',
        mainPicture: MainPicture(urlOriginal: 'mainPicture_url'),
        parent: Tag(
          id: 2,
          name: 'parent',
        ),
        relatedTags: [
          Tag(
            id: 3,
            name: 'tag_3',
          ),
          Tag(
            id: 4,
            name: 'tag_4',
          ),
        ],
        usageCount: 10,
        webLinks: [
          const WebLink(
            id: 1,
          ),
        ],
      );

      expect(Tag.fromJson(json), expected);
    });

    test('parse json with only required data success', () {
      const raw = '{"id": 1}';
      final json = jsonDecode(raw);
      final expected = Tag(id: 1);

      expect(Tag.fromJson(json), expected);
    });
  });
}
