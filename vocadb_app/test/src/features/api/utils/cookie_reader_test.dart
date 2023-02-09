import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/api/utils/cookie_reader.dart';

void main() {
  test('cookie reader read given key success', () async {
    const cookie =
        '.AspNetCore.Antiforgery.D1xlUe6EjVo=CfDJ8LqE1qELWY5OoSDCgE4RsNCvwEAeRx3JOc5-1THE8v1b-OSJd1U-VF0bcK4gyHZt-xtiVXze7sPMP-fIo93J6aht_wBGNgecYxIi1yul0S_bYmMbEWipMjqtukW1ElK4Jo8_fJRVq1hd6Zf1ccAPqgI; path=/; samesite=strict; httponly,XSRF-TOKEN=ABC; path=/';
    expect(CookieReader.read(cookie, 'XSRF-TOKEN'), 'ABC');
  });
  test('cookie reader read not found from given key', () async {
    const cookie = 'XSRF-TOKEN=ABC; path=/';

    expect(CookieReader.read(cookie, 'XSRF-X'), '');
  });
  test('invalid cookie', () async {
    expect(CookieReader.read('ABC', 'XSRF-X'), '');
    expect(CookieReader.read('ABC=X', 'XSRF-X'), '');
    expect(CookieReader.read('ABC;;A', 'XSRF-X'), '');
  });
}
