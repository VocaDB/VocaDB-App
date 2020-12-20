import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/models.dart';

void main() {
  group('Lyric', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "id": 548,
        "translationType": "Original",
        "value": "hello"
      };

      LyricModel result = LyricModel.fromJson(mockJson);
      expect(result.id, 548);
      expect(result.translationType, "Original");
      expect(result.value, "hello");
    });

    test('should not thrown exception when input empty json', () {
      LyricModel result = LyricModel.fromJson({});
      expect(result, isNotNull);
    });
  });
}
