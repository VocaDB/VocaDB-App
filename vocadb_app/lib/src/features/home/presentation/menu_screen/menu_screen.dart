import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Log in'),
            onTap: () => {},
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
