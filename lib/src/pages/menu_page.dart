import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/services.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService authService = Get.find();
    return Scaffold(
      body: ListView(
        children: [
          Obx(
            () => Visibility(
                visible: authService.currentUser().id != null,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(authService
                            .currentUser()
                            .imageUrl ??
                        'https://via.placeholder.com/150x150?text=no_image'),
                  ),
                  title: Text(authService.currentUser().name ?? 'Unknown'),
                )),
          ),
          Obx(() => Visibility(
                visible: authService.currentUser().id == null,
                child: ListTile(
                  leading: Icon(Icons.login),
                  title: Text('Log in'),
                  onTap: () => Get.off(LoginPage()),
                ),
              )),
          Obx(() => Visibility(
                visible: authService.currentUser().id != null,
                child: ListTile(
                  leading: Icon(Icons.library_music),
                  title: Text('Favorite songs'),
                  onTap: () => Get.toNamed(Routes.FAVORITE_SONGS),
                ),
              )),
          Obx(() => Visibility(
                visible: authService.currentUser().id != null,
                child: ListTile(
                  leading: Icon(Icons.people),
                  title: Text('Followed artists'),
                  onTap: () => Get.toNamed(Routes.FAVORITE_ARTISTS),
                ),
              )),
          Obx(() => Visibility(
                visible: authService.currentUser().id != null,
                child: ListTile(
                  leading: Icon(Icons.album),
                  title: Text('Collections'),
                  onTap: () => Get.toNamed(Routes.FAVORITE_ALBUMS),
                ),
              )),
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
          Obx(() => Visibility(
                visible: authService.currentUser().id != null,
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Log out'),
                  onTap: () {
                    authService.logout();
                    Get.off(LoginPage());
                  },
                ),
              )),
        ],
      ),
    );
  }
}
