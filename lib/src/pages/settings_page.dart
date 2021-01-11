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
        appBar: AppBar(title: Text('settings'.tr)),
        body: ListView(
          children: [
            RadioButtonGroup(
              label: 'theme'.tr,
              value: 'dark',
              items: [
                RadioButtonItem(label: 'Dark', value: 'dark'),
                RadioButtonItem(label: 'Light', value: 'light')
              ],
            ),
            Divider(),
            Obx(
              () => RadioButtonGroup(
                label: 'contentLanguage'.tr,
                value: pref.contentLang.string,
                onChanged: pref.updateContentLang,
                items: [
                  RadioButtonItem(label: 'Original', value: 'Default'),
                  RadioButtonItem(label: 'English', value: 'English'),
                  RadioButtonItem(label: 'Romaji', value: 'Romaji'),
                  RadioButtonItem(label: 'Japanese', value: 'Japanese')
                ],
              ),
            ),
            Divider(),
            RadioButtonGroup(
              label: 'uiLanguage'.tr,
              value: pref.uiLang.val,
              onChanged: pref.updateUiLang,
              items: [
                RadioButtonItem(label: 'English', value: 'en'),
                RadioButtonItem(label: '日本語 (Japanese)', value: 'ja'),
                RadioButtonItem(label: 'ไทย (Thai)', value: 'th'),
                RadioButtonItem(label: 'Melayu (Malay)', value: 'ms'),
                RadioButtonItem(label: '中文 (Chinese)', value: 'zh')
              ],
            )
          ],
        ));
  }
}
