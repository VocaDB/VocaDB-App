import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/pv.dart';

void main() {
  group('PV', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "id": 1,
        "name": "Melt",
        "service": "Youtube",
        "url": "https://youtube.com",
      };

      PV result = PV.fromJson(mockJson);
      expect(result.id, 1);
      expect(result.name, "Melt");
      expect(result.service, "Youtube");
      expect(result.url, "https://youtube.com");
    });

    test('should not thrown exception when input empty json', () {
      PV result = PV.fromJson({});
      expect(result, isNotNull);
    });
  });
}
