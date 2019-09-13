import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/main_picture.dart';

void main() {
  group('MainPicture', () {
    test('should parse from json correctly', () {
      const mockJson = {
        "meme": "jpeg",
        "urlSmallThumb": "https://1",
        "urlThumb": "https://2",
        "urlTinyThumb": "https://3",
      };

      MainPicture result = MainPicture.fromJson(mockJson);
      expect(result.meme, "jpeg");
      expect(result.urlSmallThumb, "https://1");
      expect(result.urlThumb, "https://2");
      expect(result.urlTinyThumb, "https://3");
    });

    test('should not thrown exception when input empty json', () {
      MainPicture result = MainPicture.fromJson({});
      expect(result, isNotNull);
    });
  });
}
