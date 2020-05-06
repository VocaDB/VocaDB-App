import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/models.dart';

void main() {
  group('PV', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "id": 1,
        "name": "Melt",
        "service": "Youtube",
        "url": "https://youtube.com",
      };

      PVModel result = PVModel.fromJson(mockJson);
      expect(result.id, 1);
      expect(result.name, "Melt");
      expect(result.service, "Youtube");
      expect(result.url, "https://youtube.com");
    });

    test('should not thrown exception when input empty json', () {
      PVModel result = PVModel.fromJson({});
      expect(result, isNotNull);
    });
  });

  group('PV List', () {
    test('should return true if PV list contains youtube', () {
      final pvList = PVList([
        PVModel.fromJson({
          "id": 1,
          "name": "A",
          "service": "Any",
          "url": "https://any.com",
        }),
        PVModel.fromJson({
          "id": 2,
          "name": "B",
          "service": "Youtube",
          "url": "https://youtube.com",
        }),
      ]);

      expect(pvList.isContainsYoutube, isTrue);
    });

    test('should return false if PV list not contains youtube', () {
      final pvList = PVList([
        PVModel.fromJson({
          "id": 1,
          "name": "A",
          "service": "Nico",
          "url": "https://nico.fromJson"
        }),
        PVModel.fromJson({
          "id": 2,
          "name": "B",
          "service": "soundcloud",
          "url": "https://soundcloud.com",
        }),
      ]);

      expect(pvList.isContainsYoutube, isFalse);
    });
  });
}
