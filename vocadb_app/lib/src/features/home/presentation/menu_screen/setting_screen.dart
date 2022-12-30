import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/simple_radio_group.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';

// TODO : need implementation
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SimpleRadioGroup(
            title: const Text('Preferred display language'),
            groupValue: 'Default',
            onChanged: (value) {},
            items: const [
              SimpleRadioItem(name: 'Original', value: 'Default'),
              SimpleRadioItem(name: 'English', value: 'English'),
              SimpleRadioItem(name: 'Romaji', value: 'Romaji'),
              SimpleRadioItem(name: 'Japanese', value: 'Japanese'),
            ],
          ),
          const Divider(),
          SimpleRadioGroup(
            title: const Text('Interface language'),
            groupValue: 'en',
            onChanged: (value) {},
            items: const [
              SimpleRadioItem(name: 'English', value: 'en'),
              SimpleRadioItem(name: '日本語 (Japanese)', value: 'ja'),
              SimpleRadioItem(name: 'ไทย (Thai)', value: 'th'),
              SimpleRadioItem(name: 'Melayu (Malay)', value: 'ms'),
              SimpleRadioItem(name: '中文 (Chinese)', value: 'zh'),
            ],
          )
        ],
      ),
    );
  }
}
