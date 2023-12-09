import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/albums/domain/disc.dart';

void main() {
  group('disc', () {
    test('parse json with all data', () {
      const raw = '''
      {
        "id": 1,
        "discNumber": 1,
        "mediaType": "Audio",
        "name": "CD"
      }
      ''';
      final json = jsonDecode(raw);
      final expected =
          Disc(id: 1, discNumber: 1, mediaType: 'Audio', name: 'CD');

      expect(Disc.fromJson(json), expected);
    });

    test('parse json with empty data success', () {
      const raw = '{}';
      final json = jsonDecode(raw);
      final expected = Disc();

      expect(Disc.fromJson(json), expected);
    });
  });
}
