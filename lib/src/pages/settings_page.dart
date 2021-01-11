import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/widgets.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SharedPreferenceService pref = Get.find();

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
              label: 'uiLanguage'.tr,
              value: pref.uiLang.val,
              onChanged: pref.updateUiLang,
              items: [
                RadioButtonItem(label: 'English', value: 'en_US'),
                RadioButtonItem(label: '日本語 (Japanese)', value: 'ja_JP'),
                RadioButtonItem(label: 'ไทย (Thai)', value: 'th_TH'),
                RadioButtonItem(label: 'Melayu (Malay)', value: 'ms_MY')
              ],
            )
          ],
        ));
  }
}
