import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:vocadb/pages/setting/setting_page.dart';
import 'package:vocadb/pages/users/favorite_song_page.dart';

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
          onTap: () =>
              Navigator.pushNamed(context, FavoriteSongScreen.routeName),
          leading: Icon(Icons.library_music),
          title: Text("Favorite songs"),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingPage()));
          },
          leading: Icon(Icons.settings),
          title: Text("Settings"),
        ),
        FutureBuilder(
          future: PackageInfo.fromPlatform(),
          builder: (context, snapshot) {
            String versionName = 'Unknown';
            if (snapshot.connectionState == ConnectionState.done) {
              PackageInfo packageInfo = snapshot.data;
              versionName = '${packageInfo.version}-${packageInfo.buildNumber}';
            }
            return ListTile(
              leading: Icon(Icons.info),
              title: Text("Version"),
              subtitle: Text(versionName),
            );
          },
        ),
      ],
    );
  }
}
