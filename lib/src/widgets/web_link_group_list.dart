import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';
import 'package:get/get.dart';

/// A widget display list of pvs grouping by category
class WebLinkGroupList extends StatelessWidget {
  final List<WebLinkModel> webLinks;

  final Function(WebLinkModel) onTap;

  const WebLinkGroupList({@required this.webLinks, this.onTap});

  List<Widget> _generateItems() {
    List<Widget> items = [];

    WebLinkList webLinkList = WebLinkList(webLinks);

    List<WebLinkModel> officialLinks = webLinkList.officialLinks;
    List<WebLinkModel> unofficialLinks = webLinkList.unofficialLinks;

    if (officialLinks.isNotEmpty) {
      items.add(ListTile(
        title: Text('officialLinks'.tr),
      ));
      items.addAll(officialLinks.map(_mapWebLinkTile));
    }

    if (unofficialLinks.isNotEmpty) {
      items.add(ListTile(
        title: Text('unofficialLinks'.tr),
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
    if (this.webLinks == null || this.webLinks.isEmpty) return Container();

    return Column(
      children: _generateItems(),
    );
  }
}
