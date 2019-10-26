import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/profile_bloc.dart';
import 'package:vocadb/pages/contact_us/contact_us_page.dart';
import 'package:vocadb/pages/setting/setting_page.dart';
import 'package:vocadb/pages/users/favorite_album_page.dart';
import 'package:vocadb/pages/users/favorite_artist_page.dart';
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
          onTap: () {
            Provider.of<ProfileBloc>(context).importProfile().then((_) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Profile imported!'),
              ));
            }).catchError((Error e) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Unable to import file.'),
              ));
              print(e);
            });
          },
          leading: Icon(Icons.file_download),
          title: Text(FlutterI18n.translate(context, 'label.importProfile')),
        ),
        ListTile(
          onTap: () {
            Provider.of<ProfileBloc>(context).exportProfile().catchError((e) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Unable to export file.'),
              ));
              print(e);
            });
          },
          leading: Icon(Icons.file_upload),
          title: Text(FlutterI18n.translate(context, 'label.exportProfile')),
        ),
        ListTile(
          onTap: () =>
              Navigator.pushNamed(context, FavoriteSongScreen.routeName),
          leading: Icon(Icons.library_music),
          title: Text(FlutterI18n.translate(context, 'label.favoriteSongs')),
        ),
        ListTile(
          onTap: () =>
              Navigator.pushNamed(context, FavoriteArtistScreen.routeName),
          leading: Icon(Icons.people),
          title: Text(FlutterI18n.translate(context, 'label.favoriteArtists')),
        ),
        ListTile(
          onTap: () =>
              Navigator.pushNamed(context, FavoriteAlbumScreen.routeName),
          leading: Icon(Icons.album),
          title: Text(FlutterI18n.translate(context, 'label.favoriteAlbums')),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingPage()));
          },
          leading: Icon(Icons.settings),
          title: Text(FlutterI18n.translate(context, 'label.settings')),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactUsPage()));
          },
          leading: Icon(Icons.help),
          title: Text(FlutterI18n.translate(context, 'label.contact')),
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
              title: Text(FlutterI18n.translate(context, "label.version")),
              subtitle: Text(versionName),
            );
          },
        ),
      ],
    );
  }
}
