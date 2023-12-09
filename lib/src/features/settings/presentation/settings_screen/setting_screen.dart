import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/settings/presentation/settings_screen/setting_interface_lang.dart';
import 'package:vocadb_app/src/features/settings/presentation/settings_screen/setting_preferred_lang.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: const [
          SettingPreferredLang(),
          Divider(),
          SettingInterfaceLang(),
        ],
      ),
    );
  }
}
