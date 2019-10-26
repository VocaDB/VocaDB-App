import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/widgets/site_tile.dart';

class ContactUsPage extends StatelessWidget {
  static const String routeName = '/contactUs';

  static void navigate(BuildContext context) {
    Navigator.pushNamed(context, ContactUsPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FlutterI18n.translate(context, 'label.contact')),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(APP_NAME),
          ),
          Column(
            children: contactSites
                .map((site) => SiteTile(
                      title: site['title'],
                      url: site['url'],
                    ))
                .toList(),
          ),
          Divider(),
          ListTile(
            title:
                Text(FlutterI18n.translate(context, 'label.developerContact')),
          ),
          Column(
            children: contactDeveloperSites
                .map((site) => SiteTile(
                      title: site['title'],
                      url: site['url'],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
