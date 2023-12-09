import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

void main() {
  group('web_link', () {
    test('parse json with all data success', () {
      const raw =
          '{"id": 1,"description":"weblink desc","category":"web","url":"https://testurl.net"}';
      final json = jsonDecode(raw);
      const expected = WebLink(
        id: 1,
        description: 'weblink desc',
        category: 'web',
        url: 'https://testurl.net',
      );

      expect(WebLink.fromJson(json), expected);
    });

    test('parse json with only id success', () {
      const raw = '{"id": 1}';
      final json = jsonDecode(raw);
      const expected = WebLink(
        id: 1,
      );

      expect(WebLink.fromJson(json), expected);
    });
  });
}
