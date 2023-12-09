class CookieReader {
  static String read(String setCookie, String name) {
    final cookies = setCookie.split(';');

    for (String cookie in cookies) {
      final keyValues = cookie.split('=');
      if (keyValues[0].contains(name)) {
        String result = (keyValues.length > 1) ? keyValues[1] : '';
        return result.replaceAll('httponly,', '');
      }
    }

    return '';
  }
}
