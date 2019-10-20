import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb/models/web_link_model.dart';
import 'package:vocadb/utils/icon_site.dart';
import 'package:vocadb/widgets/site_tile.dart';

class WebLinkTile extends StatelessWidget {
  final WebLinkModel webLink;

  const WebLinkTile(
    this.webLink, {
    Key key,
  }) : super(key: key);

  Widget buildLeading() {
    IconSite ic = IconSiteList.findIconAsset(webLink.description);

    return (ic == null) ? Icon(Icons.web) : buildImageIcon(ic.assetName);
  }

  Widget buildImageIcon(String assetName) {
    return SizedBox(
      width: 32,
      height: 32,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Image.asset(assetName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SiteTile(
      title: webLink.description,
      url: webLink.url,
    );
  }
}
