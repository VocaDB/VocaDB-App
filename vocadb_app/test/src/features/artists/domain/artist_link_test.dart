import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_link.dart';

void main() {
  group('artist_link', () {
    test('parse json with all data', () {
      const raw = '''
      {
        "linkType": "link_type",
        "artist": {
          "id": 1
        }
      }
      ''';
      final json = jsonDecode(raw);
      final expected = ArtistLink(
        linkType: 'link_type',
        artist: Artist(id: 1),
      );

      expect(ArtistLink.fromJson(json), expected);
    });
  });
}
