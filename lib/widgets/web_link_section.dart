import 'package:flutter/material.dart';
import 'package:vocadb/models/web_link_model.dart';
import 'package:vocadb/widgets/web_link.dart';

class WebLinkSection extends StatelessWidget {
  final List<WebLinkModel> webLinks;
  final String title;

  const WebLinkSection({Key key, this.webLinks, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if (webLinks.length == 0) {
      return Container();
    }

    if (this.title != null) {
      children.add(Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          title,
          textDirection: TextDirection.ltr,
          style: Theme.of(context).textTheme.subhead,
        ),
      ));

      List<Widget> allWebLinks =
          this.webLinks.map((link) => WebLinkTile(link)).toList();

      children.addAll(allWebLinks);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    }

    final WebLinkList webLinkList = WebLinkList(webLinks);

    if (webLinkList.officialLinks.length > 0) {
      children.add(Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Official links',
          textDirection: TextDirection.ltr,
          style: Theme.of(context).textTheme.subhead,
        ),
      ));

      List<Widget> officialLinks =
          webLinkList.officialLinks.map((link) => WebLinkTile(link)).toList();

      children.addAll(officialLinks);
    }

    if (webLinkList.unofficialLinks.length > 0) {
      children.add(Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Unofficial links',
          textDirection: TextDirection.ltr,
          style: Theme.of(context).textTheme.subhead,
        ),
      ));

      List<Widget> unofficialLinks =
          webLinkList.unofficialLinks.map((link) => WebLinkTile(link)).toList();

      children.addAll(unofficialLinks);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
