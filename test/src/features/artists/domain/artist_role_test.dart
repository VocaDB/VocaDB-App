import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';

void main() {
  group('artist_role', () {
    test('parse json with all data', () {
      const raw = '''
      {
        "id": 3,
        "name": "a_name",
        "categories": "cat",
        "effectiveRoles": "Vocalist",
        "roles": "Vocalist",
        "artist": {
          "id": 1
        }
      }
      ''';
      final json = jsonDecode(raw);
      final expected = ArtistRole(
        id: 3,
        name: 'a_name',
        categories: 'cat',
        effectiveRoles: 'Vocalist',
        roles: 'Vocalist',
        artist: Artist(id: 1),
      );

      expect(ArtistRole.fromJson(json), expected);
    });

    test('parse json without required data', () {
      const raw = '''{}''';
      final json = jsonDecode(raw);
      final expected = ArtistRole();

      expect(ArtistRole.fromJson(json), expected);
    });
  });
}
