import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb/models/web_link_model.dart';

class WebLinkTile extends StatelessWidget {

  final WebLinkModel webLink;

  const WebLinkTile(this.webLink, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () { launch(webLink.url); },
      leading: Icon(Icons.web),
      title: Text(webLink.description),
    );
  }
}
