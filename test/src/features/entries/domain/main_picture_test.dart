import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';

void main() {
  group('main_picture', () {
    test('parse json with all data', () {
      const raw = '''
      {
        "mime": "image/png",
        "urlOriginal": "url_ori",
        "urlSmallThumb": "url_small",
        "urlThumb": "url_thumb",
        "urlTinyThumb": "url_tiny"
      }
      ''';
      final json = jsonDecode(raw);
      final expected = MainPicture(
        mime: 'image/png',
        urlOriginal: 'url_ori',
        urlSmallThumb: 'url_small',
        urlThumb: 'url_thumb',
        urlTinyThumb: 'url_tiny',
      );

      expect(MainPicture.fromJson(json), expected);
    });

    test('parse json with empty data success', () {
      const raw = '{}';
      final json = jsonDecode(raw);
      final expected = MainPicture();

      expect(MainPicture.fromJson(json), expected);
    });
  });
}
