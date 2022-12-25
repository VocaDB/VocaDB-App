import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/site_tile.dart';
import 'package:vocadb_app/src/utils/icon_site.dart';

/// A widget for display web link and redirect to the given url
class WebLinkTile extends StatelessWidget {
  final WebLink webLink;

  final double iconSize;

  const WebLinkTile({super.key, required this.webLink, this.iconSize = 32});

  Widget buildLeading() {
    IconSite ic = IconSiteList.findIconAsset(webLink.description);

    return (ic == null) ? const Icon(Icons.web) : buildImageIcon(ic.assetName);
  }

  Widget buildImageIcon(String assetName) {
    return SizedBox(
      width: iconSize,
      height: iconSize,
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
