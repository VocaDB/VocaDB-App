import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/pages.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.gravatar.com/avatar/4ec0368f4caddce464a7c513c0b73f80?s=120'),
            ),
            title: Text('up2up'),
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Log in'),
            onTap: () => Get.off(LoginPage()),
          ),
          ListTile(
            leading: Icon(Icons.library_music),
            title: Text('Favorite songs'),
            onTap: () => Get.to(FavoriteSongPage()),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Followed artists'),
            onTap: () => Get.to(FavoriteArtistPage()),
          ),
          ListTile(
            leading: Icon(Icons.album),
            title: Text('Collections'),
            onTap: () => Get.to(FavoriteAlbumPage()),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => Get.to(SettingsPage()),
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Contact us'),
            onTap: () => Get.to(ContactUsPage()),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Version'),
            subtitle: Text('3.1'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: () => Get.off(LoginPage()),
          ),
        ],
      ),
    );
  }
}
