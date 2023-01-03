import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/albums/domain/release_date.dart';

void main() {
  group('release_date', () {
    test('parse json with all data', () {
      const raw = '''
      {
        "day": 11,
        "month":1,
        "formatted":"2022/01/01",
        "year":2022
      }
      ''';
      final json = jsonDecode(raw);
      final expected =
          ReleaseDate(day: 11, month: 1, formatted: '2022/01/01', year: 2022);

      expect(ReleaseDate.fromJson(json), expected);
    });

    test('parse json with empty data success', () {
      const raw = '{}';
      final json = jsonDecode(raw);
      final expected = ReleaseDate();

      expect(ReleaseDate.fromJson(json), expected);
    });
  });
}
