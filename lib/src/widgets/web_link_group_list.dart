import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget display list of pvs grouping by category
class WebLinkGroupList extends StatelessWidget {
  final List<WebLinkModel> webLinks;

  final Function(WebLinkModel) onTap;

  const WebLinkGroupList({@required this.webLinks, this.onTap})
      : assert(webLinks != null);

  List<Widget> _generateItems() {
    List<Widget> items = [];

    WebLinkList webLinkList = WebLinkList(webLinks);

    List<WebLinkModel> officialLinks = webLinkList.officialLinks;
    List<WebLinkModel> unofficialLinks = webLinkList.unofficialLinks;

    if (officialLinks.isNotEmpty) {
      items.add(ListTile(
        title: Text('Official links'),
      ));
      items.addAll(officialLinks.map(_mapWebLinkTile));
    }

    if (unofficialLinks.isNotEmpty) {
      items.add(ListTile(
        title: Text('Unofficial links'),
      ));
      items.addAll(unofficialLinks.map(_mapWebLinkTile));
    }

    return items;
  }

  WebLinkTile _mapWebLinkTile(WebLinkModel model) {
    return WebLinkTile(
      title: model.description,
      url: model.url,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _generateItems(),
    );
  }
}