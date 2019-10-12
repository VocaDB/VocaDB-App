import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/artist_relations_model.dart';

void main() {
  group('Artist relations model', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "latestSongs": [
          {"id": 1, "name": "song_a"},
          {"id": 2, "name": "song_b"}
        ],
        "latestAlbums": [
          {"id": 1, "name": "album_a"},
          {"id": 2, "name": "album_b"},
        ],
        "popularSongs": [
          {"id": 1, "name": "album_a"},
          {"id": 2, "name": "album_b"},
        ],
        "popularAlbums": [
          {"id": 1, "name": "album_a"},
          {"id": 2, "name": "album_b"},
        ]
      };

      ArtistRelations result = ArtistRelations.fromJson(mockJson);
      expect(result, isNotNull);
      expect(result.latestSongs, isNotNull);
      expect(result.latestSongs.length, 2);
      expect(result.latestAlbums, isNotNull);
      expect(result.latestAlbums.length, 2);
      expect(result.popularSongs, isNotNull);
      expect(result.popularSongs.length, 2);
      expect(result.popularAlbums, isNotNull);
      expect(result.popularAlbums.length, 2);
    });

    test('should not thrown exception when input empty json', () {
      ArtistRelations result = ArtistRelations.fromJson({});
      expect(result, isNotNull);
      expect(result.latestSongs, isEmpty);
      expect(result.popularAlbums, isEmpty);
      expect(result.latestAlbums, isEmpty);
      expect(result.popularAlbums, isEmpty);
    });
  });
}
