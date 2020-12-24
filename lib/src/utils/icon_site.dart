/// An util class for get icon asset base on given url.
class IconSite {
  final String urlPattern;
  final String assetName;

  IconSite(this.urlPattern, this.assetName);

  RegExp get urlPatternRegExp => new RegExp(urlPattern, caseSensitive: false);

  bool hasMatch(String input) {
    return urlPatternRegExp.hasMatch(input);
  }
}

/// A wrapper class of [IconSite] for manipulate list.
class IconSiteList {
  static List<IconSite> _icons = [
    IconSite('youtube', 'assets/images/icon_youtube.png'),
    IconSite('soundcloud', 'assets/images/icon_soundcloud.png'),
    IconSite('piapro', 'assets/images/icon_piapro.png'),
    IconSite('vimeo', 'assets/images/icon_vimeo.png'),
    IconSite('facebook', 'assets/images/icon_facebook.png'),
    IconSite('twitter', 'assets/images/icon_twitter.png'),
    IconSite('bilibili', 'assets/images/icon_bilibili.png'),
    IconSite('spotify', 'assets/images/icon_spotify.png'),
    IconSite('wikipedia', 'assets/images/icon_wikipedia.png'),
    IconSite('bandcamp', 'assets/images/icon_bandcamp.png'),
  ];

  static IconSite findIconAsset(String input) =>
      _icons.firstWhere((i) => i.hasMatch(input), orElse: () => null);
}
