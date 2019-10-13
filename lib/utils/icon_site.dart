class IconSite {
  final String urlPattern;
  final String assetName;

  IconSite(this.urlPattern, this.assetName);

  RegExp get urlPatternRegExp => new RegExp(urlPattern, caseSensitive: false);

  bool hasMatch(String input) {
    return urlPatternRegExp.hasMatch(input);
  }
}

class IconSiteList {
  static List<IconSite> _icons = [
    IconSite('youtube', 'images/icon_youtube.png'),
    IconSite('soundcloud', 'images/icon_soundcloud.png'),
    IconSite('piapro', 'images/icon_piapro.png'),
    IconSite('vimeo', 'images/icon_vimeo.png'),
    IconSite('facebook', 'images/icon_facebook.png'),
    IconSite('twitter', 'images/icon_twitter.png'),
    IconSite('bilibili', 'images/icon_bilibili.png'),
    IconSite('spotify', 'images/icon_spotify.png'),
    IconSite('wikipedia', 'images/icon_wikipedia.png'),
    IconSite('bandcamp', 'images/icon_bandcamp.png'),
  ];

  static IconSite findIconAsset(String input) =>
      _icons.firstWhere((i) => i.hasMatch(input), orElse: () => null);
}
