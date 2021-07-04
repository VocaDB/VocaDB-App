import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vocadb_app/config.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/src/config/app_translations.dart';
import 'package:vocadb_app/themes.dart';

class SharedPreferenceService extends GetxService {
  static final String container = 'pref';

  final GetStorage box;

  final uiLang = ReadWriteValue('uiLang', 'en');

  final contentLang = 'Default'.obs;

  final theme = 'dark'.obs;

  final autoPlay = true.obs;

  SharedPreferenceService({this.box});

  static String get lang =>
      Get.find<SharedPreferenceService>().contentLang.string;

  String get getContentLang =>
      Get.find<SharedPreferenceService>().contentLang.string;

  static bool get autoPlayValue =>
      Get.find<SharedPreferenceService>().autoPlay.value;

  void init() {
    initUILang();
    initContentLang();
    initTheme();
    initAutoPlay();
  }

  void initUILang() {
    print('initial shared_preference [uiLang]');
    uiLang.val = box.read('uiLang');
    AppTranslation().changeLocale(uiLang.val);
    print('current locale ${Get.locale}');
  }

  updateUiLang(String value) {
    print('Updating shared_preference [uiLang] = $value');
    box.write('uiLang', value);
    uiLang.val = value;
    AppTranslation().changeLocale(value);
    print('current locale ${Get.locale}');
  }

  void initContentLang() {
    print('initial shared_preference [contentLang]');
    contentLang(box.read('contentLang'));
  }

  updateContentLang(String value) {
    print('updating shared_preference [contentLang] = $value');
    box.write('contentLang', value);
    contentLang(value);
    Get.find<HomePageController>().fetchApi();
    Get.find<RankingController>().fetchApi();
  }

  void initTheme() {
    print('init theme ${theme.string}');
    theme(box.read('theme'));
    Themes.changeTheme(theme.string);
  }

  updateTheme(String value) {
    print('updating shared_preference [theme] = $value');
    box.write('theme', value);
    theme(value);
    Themes.changeTheme(value);
  }

  void initAutoPlay() {
    print('init autoPlay');
    autoPlay(box.read<bool>('autoPlay'));
  }

  updateAutoPlay(bool value) {
    print('updating shared_preference [autoPlay] = $value');
    box.write('autoPlay', value);
    autoPlay(value);
  }
}
