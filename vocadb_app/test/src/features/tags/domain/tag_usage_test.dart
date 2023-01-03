import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';

void main() {
  group('tag_usage', () {
    test('parse json with all data', () {
      const raw = '''
      {
        "count": 10,
        "tag": {
          "id": 1,
          "name": "tag_name"
        }
      }
      ''';
      final json = jsonDecode(raw);
      final expected = TagUsage(
        count: 10,
        tag: Tag(
          id: 1,
          name: 'tag_name',
        ),
      );

      expect(TagUsage.fromJson(json), expected);
    });
  });
}
