import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/utils/icon_site.dart';

main() {
  test('should match icon', () {
    expect(IconSiteList.findIconAsset('Spotify'), isNotNull);
    expect(IconSiteList.findIconAsset('NicoNicoPedia'), isNotNull);
    expect(IconSiteList.findIconAsset('Crypton Future Media Product Page'),
        isNull);
  });
}
