import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/utils.dart';

main() {
  test('should return https url when given http url', () {
    expect(UrlUtils.toHttps('http://i2.hdslb.com'), 'https://i2.hdslb.com');
  });

  test('should return null when given string is null', () {
    expect(UrlUtils.toHttps(null), isNull);
  });
}
