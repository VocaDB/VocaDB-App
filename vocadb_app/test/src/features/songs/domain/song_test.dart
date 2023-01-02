import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

void main() {
  group('song', () {
    test('parse json with only id success', () {
      const raw = '{"id": 1}';
      final json = jsonDecode(raw);
      const expected = Song(
        id: 1,
      );

      expect(Song.fromJson(json), expected);
    });
  });
}
