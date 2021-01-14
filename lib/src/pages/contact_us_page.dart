import 'package:flutter/material.dart';
import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/widgets.dart';
import 'package:get/get.dart';

class ContactUsPage extends StatelessWidget {
  static const String routeName = '/contactUs';

  static void navigate(BuildContext context) {
    Navigator.pushNamed(context, ContactUsPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('contact'.tr),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(appName),
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
            title: Text('developerContact'.tr),
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
