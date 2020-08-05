class UrlUtils {
  static String toHttps(String url) {
    if (url == null) return null;

    return url.replaceFirst('http:', 'https:');
  }
}
