import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/features/authentication/presentation/authenticated_widgets/authenticated_widget.dart';
import 'package:vocadb_app/src/features/authentication/presentation/authenticated_widgets/guest_widget.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class MenuScreen extends StatelessWidget {
  static const menuAccountKey = Key('menu-account-key');
  static const menuLoginKey = Key('menu-login-key');
  static const menuMySongsKey = Key('menu-my-songs-key');
  static const menuMyArtistsKey = Key('menu-my-artists-key');
  static const menuMyAlbumsKey = Key('menu-my-albums-key');
  static const menuSettingsKey = Key('menu-settings-key');
  static const menuContactKey = Key('menu-contact-key');
  static const menuAboutKey = Key('menu-about-key');

  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'VocaDB',
        displayHome: false,
      ),
      body: ListView(
        children: [
          AuthenticatedWidget(
            child: ListTile(
              key: menuAccountKey,
              leading: const Icon(Icons.person),
              title: const Text('Account'),
              onTap: () {
                GoRouter.of(context).pushNamed(AppRoute.account.name);
              },
            ),
          ),
          GuestWidget(
            child: ListTile(
              key: menuLoginKey,
              leading: const Icon(Icons.login),
              title: const Text('Log in'),
              onTap: () {
                GoRouter.of(context).pushNamed(AppRoute.signIn.name);
              },
            ),
          ),
          AuthenticatedWidget(
            child: ListTile(
              key: menuMySongsKey,
              leading: const Icon(Icons.music_note),
              title: const Text('My songs'),
              onTap: () {
                GoRouter.of(context).pushNamed(AppRoute.userRatedSongs.name);
              },
            ),
          ),
          AuthenticatedWidget(
            child: ListTile(
              key: menuMyArtistsKey,
              leading: const Icon(Icons.people),
              title: const Text('My followed artists'),
              onTap: () {
                GoRouter.of(context)
                    .pushNamed(AppRoute.userFollowedArtists.name);
              },
            ),
          ),
          AuthenticatedWidget(
            child: ListTile(
              key: menuMyAlbumsKey,
              leading: const Icon(Icons.disc_full),
              title: const Text('My albums'),
              onTap: () {
                GoRouter.of(context).pushNamed(AppRoute.userAlbums.name);
              },
            ),
          ),
          ListTile(
            key: menuSettingsKey,
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              GoRouter.of(context).pushNamed(AppRoute.settings.name);
            },
          ),
          ListTile(
            key: menuContactKey,
            leading: const Icon(Icons.email),
            title: const Text('Contact us'),
            onTap: () {
              GoRouter.of(context).pushNamed(AppRoute.contactUs.name);
            },
          ),
          const AboutListTile(
            key: menuAboutKey,
            icon: Icon(Icons.info),
            applicationIcon: FlutterLogo(),
            applicationLegalese:
                'VocaDB is a free to use database for discography information about Vocaloid and related voice synthesizers.',
            applicationName: 'VocaDB',
            applicationVersion: 'version 3.1.0-beta.2',
          ),
        ],
      ),
    );
  }
}
