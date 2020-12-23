import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Settings')),
        body: ListView(
          children: [
            RadioButtonGroup(
              label: 'Theme',
              value: 'dark',
              items: [
                RadioButtonItem(label: 'Dark', value: 'dark'),
                RadioButtonItem(label: 'Light', value: 'light')
              ],
            ),
            Divider(),
            RadioButtonGroup(
              label: 'Preferred display language',
              value: 'English',
              items: [
                RadioButtonItem(label: 'Original', value: 'Original'),
                RadioButtonItem(label: 'English', value: 'English'),
                RadioButtonItem(label: 'Romaji', value: 'Romaji'),
                RadioButtonItem(label: 'Japanese', value: 'Japanese')
              ],
            ),
            Divider(),
            RadioButtonGroup(
              label: 'Interface language',
              value: 'Thai',
              items: [
                RadioButtonItem(label: 'English', value: 'English'),
                RadioButtonItem(label: '日本語 (Japanese)', value: 'Japanese'),
                RadioButtonItem(label: 'ไทย (Thai)', value: 'Thai'),
                RadioButtonItem(label: 'Melayu (Malay)', value: 'Malay')
              ],
            )
          ],
        ));
  }
}
