import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/models/web_link_model.dart';

void main() {
  group('WebLink', () {
    test('should parse from json correctly', () {
      const mockJson = {
      "category": "Reference",
      "description": "MikuWiki",
      "id": 971,
      "url": "http://www5.atwiki.jp/hmiku/pages/4804.html"
      };

      WebLinkModel result = WebLinkModel.fromJson(mockJson);
      expect(result.id, 971);
      expect(result.description, "MikuWiki");
      expect(result.category, "Reference");
      expect(result.url, "http://www5.atwiki.jp/hmiku/pages/4804.html");
    });

    test('should not thrown exception when input empty json', () {
      WebLinkModel result = WebLinkModel.fromJson({});
      expect(result, isNotNull);
    });
  });
}
