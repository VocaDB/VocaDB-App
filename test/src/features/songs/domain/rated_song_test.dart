import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/songs/domain/rated_song.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

void main() {
  group('rated_song', () {
    test('parse json with all data', () {
      const raw = '''
      {
        "rating": "favorite",
        "song": {
          "id": 2
        }
      }
      ''';
      final json = jsonDecode(raw);
      final expected = RatedSong(
        rating: "favorite",
        song: const Song(id: 2),
      );

      expect(RatedSong.fromJson(json), expected);
    });
  });
}
