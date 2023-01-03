import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_relations.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

void main() {
  group('artist_relations', () {
    test('parse json with all data', () {
      const raw = '''
      {
        "latestSongs": [
          {
            "id": 1
          }
        ],
        "popularSongs": [
           {
            "id": 2
          }
        ],
        "latestAlbums": [
           {
            "id": 3
          }
        ],
        "popularAlbums": [
           {
            "id": 4
          }
        ]
      }
      ''';
      final json = jsonDecode(raw);
      final expected = ArtistRelations(
        latestSongs: [const Song(id: 1)],
        popularSongs: [const Song(id: 2)],
        latestAlbums: [Album(id: 3)],
        popularAlbums: [Album(id: 4)],
      );

      expect(ArtistRelations.fromJson(json), expected);
    });

    test('parse json without required data', () {
      const raw = '''{}''';
      final json = jsonDecode(raw);
      final expected = ArtistRelations();

      expect(ArtistRelations.fromJson(json), expected);
    });
  });
}
