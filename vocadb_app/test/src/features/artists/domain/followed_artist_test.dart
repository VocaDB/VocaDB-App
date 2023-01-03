import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/domain/followed_artist.dart';

void main() {
  group('followed_artist', () {
    test('parse json with all data', () {
      const raw = '''
      {
        "id": 3,
        "artist": {
          "id": 1
        }
      }
      ''';
      final json = jsonDecode(raw);
      final expected = FollowedArtist(
        id: 3,
        artist: Artist(id: 1),
      );

      expect(FollowedArtist.fromJson(json), expected);
    });
  });
}
