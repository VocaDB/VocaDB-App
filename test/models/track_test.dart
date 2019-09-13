import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/track.dart';

void main() {
  group('Track', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "id": 1,
        "name": "abc",
        "trackNumber": 2,
        "discNumber": 3,
        "song": {"id": 4, "name": "melt"},
      };

      Track result = Track.fromJson(mockJson);
      expect(result.id, 1);
      expect(result.name, "abc");
      expect(result.trackNumber, 2);
      expect(result.discNumber, 3);
      expect(result.song, isNotNull);
      expect(result.song.id, 4);
      expect(result.song.name, "melt");
    });

    test('should not thrown exception when input empty json', () {
      Track result = Track.fromJson({});
      expect(result, isNotNull);
      expect(result.song, isNull);
    });
  });
}
