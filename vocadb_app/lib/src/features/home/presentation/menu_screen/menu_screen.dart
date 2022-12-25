import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/features/authentication/presentation/authenticated_widgets/authenticated_widget.dart';
import 'package:vocadb_app/src/features/authentication/presentation/authenticated_widgets/guest_widget.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AuthenticatedWidget(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Account'),
              onTap: () {
                GoRouter.of(context).pushNamed(AppRoute.account.name);
              },
            ),
          ),
          GuestWidget(
            child: ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Log in'),
              onTap: () {
                GoRouter.of(context).pushNamed(AppRoute.signIn.name);
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Contact us'),
            onTap: () => {},
          ),
          const AboutListTile(
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
