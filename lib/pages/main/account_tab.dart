import 'package:flutter/material.dart';
import 'package:vocadb/pages/login/login_page.dart';
import 'package:vocadb/pages/setting/setting_page.dart';

class AccountTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GuestTab();
  }
}

class GuestTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          leading: Icon(Icons.lock),
          title: Text("Sign in"),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingPage()));
          },
          leading: Icon(Icons.settings),
          title: Text("Setting"),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text("Version"),
          subtitle: Text("3.0.0-alpha.1"),
        )
      ],
    );
  }
}
