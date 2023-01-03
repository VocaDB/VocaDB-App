import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/albums/domain/track.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

void main() {
  group('track', () {
    test('parse json with all data', () {
      const raw = '''
      {
        "id": 1,
        "discNumber": 1,
        "song": {"id": 1},
        "trackNumber": 1
      }
      ''';
      final json = jsonDecode(raw);
      final expected = Track(
        id: 1,
        discNumber: 1,
        trackNumber: 1,
        song: const Song(id: 1),
      );

      expect(Track.fromJson(json), expected);
    });
  });
}
