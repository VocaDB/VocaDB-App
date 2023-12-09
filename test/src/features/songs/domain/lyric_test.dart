import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/songs/domain/lyric.dart';

void main() {
  group('lyric', () {
    test('parse json with all data', () {
      const raw = '''
      {
        "id": 1,
        "cultureCode": "en",
        "source": "src",
        "translationType": "trans",
        "url": "test-url",
        "value": "lyric_value"
      }
      ''';
      final json = jsonDecode(raw);
      final expected = Lyric(
          id: 1,
          cultureCode: 'en',
          source: 'src',
          translationType: 'trans',
          url: 'test-url',
          value: 'lyric_value');

      expect(Lyric.fromJson(json), expected);
    });

    test('parse json without required data', () {
      const raw = '''{
        "id": 1
      }''';
      final json = jsonDecode(raw);
      final expected = Lyric(id: 1);

      expect(Lyric.fromJson(json), expected);
    });
  });
}
