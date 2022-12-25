import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link_list.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_tile.dart';

/// A widget display list of pvs grouping by category
class WebLinkGroupList extends StatelessWidget {
  final List<WebLink> webLinks;

  final Function(WebLink)? onTap;

  const WebLinkGroupList({super.key, required this.webLinks, this.onTap});

  List<Widget> _generateItems() {
    List<Widget> items = [];

    WebLinkList webLinkList = WebLinkList(webLinks);

    List<WebLink> officialLinks = webLinkList.officialLinks;
    List<WebLink> unofficialLinks = webLinkList.unofficialLinks;

    if (officialLinks.isNotEmpty) {
      items.add(const ListTile(
        title: Text('Official'),
      ));
      items.addAll(officialLinks.map(_mapWebLinkTile));
    }

    if (unofficialLinks.isNotEmpty) {
      items.add(const ListTile(
        title: Text('Unofficial'),
      ));
      items.addAll(unofficialLinks.map(_mapWebLinkTile));
    }

    return items;
  }

  WebLinkTile _mapWebLinkTile(WebLink webLink) {
    return WebLinkTile(webLink: webLink);
  }

  @override
  Widget build(BuildContext context) {
    if (webLinks.isEmpty) return Container();

    return Column(
      children: _generateItems(),
    );
  }
}
