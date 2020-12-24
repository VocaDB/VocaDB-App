import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

/// A widget for display redirect website as list tile and automatic display icon base on domain site.
class SiteTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String url;

  const SiteTile({Key key, this.title, this.subtitle, this.url})
      : super(key: key);

  IconData getIconFromUrl(String url) {
    final List<Map<String, dynamic>> siteIcons = [
      {"pattern": "facebook", "icon": FontAwesomeIcons.facebook},
      {"pattern": "twitter", "icon": FontAwesomeIcons.twitter},
      {"pattern": "vk.com", "icon": FontAwesomeIcons.vk},
      {"pattern": "Chat", "icon": Icons.chat_bubble},
      {"pattern": "github", "icon": FontAwesomeIcons.github},
      {"pattern": "mailto", "icon": Icons.mail},
      {"pattern": "soundcloud", "icon": FontAwesomeIcons.soundcloud},
      {"pattern": "spotify", "icon": FontAwesomeIcons.spotify},
      {"pattern": "tumblr", "icon": FontAwesomeIcons.tumblr},
      {"pattern": "weibo", "icon": FontAwesomeIcons.weibo},
      {"pattern": "youtube", "icon": FontAwesomeIcons.youtube},
      {"pattern": "wikipedia", "icon": FontAwesomeIcons.wikipediaW},
      {"pattern": "deviantart", "icon": FontAwesomeIcons.deviantart},
      {"pattern": "patreon", "icon": FontAwesomeIcons.patreon},
      {"pattern": "bandcamp", "icon": FontAwesomeIcons.bandcamp},
      {"pattern": "nico", "icon": FontAwesomeIcons.tv},
      {"pattern": "bilibili", "icon": FontAwesomeIcons.tv},
      {"pattern": "amazon", "icon": FontAwesomeIcons.amazon},
      {"pattern": "itunes", "icon": FontAwesomeIcons.itunes},
      {"pattern": "play.google", "icon": FontAwesomeIcons.googlePlay},
    ];

    Map<String, dynamic> iconWebsite = siteIcons
        .firstWhere((s) => url.contains(s['pattern']), orElse: () => null);

    if (iconWebsite == null) return Icons.web;

    return iconWebsite['icon'];
  }

  void openUrl(BuildContext context) async {
    String encodedUrl = Uri.encodeFull(url);

    if (await canLaunch(encodedUrl)) {
      launch(encodedUrl);
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Unable to open url $encodedUrl'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (subtitle != null) {
      return ListTile(
        leading: Icon(getIconFromUrl(url)),
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: () => openUrl(context),
      );
    }

    return ListTile(
      leading: Icon(getIconFromUrl(url)),
      title: Text(title),
      onTap: () => openUrl(context),
    );
  }
}
