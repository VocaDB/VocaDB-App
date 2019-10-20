import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/artist_song_model.dart';

void main() {
  group('Artist song model', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "categories": "Vocalist",
        "effectiveRoles": "Default",
        "id": 918,
        "name": "初音ミク",
        "roles": "Default",
        "artist": {
          "additionalNames": "Hatsune Miku",
          "artistType": "Vocaloid",
          "id": 1,
          "name": "初音ミク",
        }
      };

      ArtistSongModel result = ArtistSongModel.fromJson(mockJson);
      expect(result.id, 918);
      expect(result.name, "初音ミク");
      expect(result.categories, "Vocalist");
      expect(result.roles, "Default");
      expect(result.effectiveRoles, "Default");
      expect(result.artist, isNotNull);
      expect(result.artistId, 1);
      expect(result.artistName, "初音ミク");
    });

    test('should not thrown exception when input empty json', () {
      ArtistSongModel result = ArtistSongModel.fromJson({});
      expect(result, isNotNull);
      expect(result.artist, isNull);
    });

    test('should return zero when get aritst id and aritst field is missing',
        () {
      const mockJson = {
        "categories": "Vocalist",
        "effectiveRoles": "Default",
        "roles": "Default",
      };

      ArtistSongModel result = ArtistSongModel.fromJson(mockJson);
      expect(result, isNotNull);
      expect(result.artistId, 0);
    });

    test('should return default artist name when artist field is missing', () {
      const mockJson = {
        "categories": "Vocalist",
        "effectiveRoles": "Default",
        "id": 918,
        "name": "初音ミク",
        "roles": "Default",
      };

      ArtistSongModel result = ArtistSongModel.fromJson(mockJson);
      expect(result, isNotNull);
      expect(result.artistName, "初音ミク");
    });
  });
}
