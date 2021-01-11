import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vocadb_app/config.dart';
import 'package:vocadb_app/src/config/app_translations.dart';

class SharedPreferenceService extends GetxService {
  static final String container = 'pref';

  final GetStorage box;

  final uiLang = ReadWriteValue('uiLang', 'en_US');

  SharedPreferenceService({this.box});

  void init() {
    uiLang.val = box.read('uiLang');
    AppTranslation().changeLocale(uiLang.val);
    print('current locale $Get.locale');
  }

  updateUiLang(String value) {
    box.write('uiLang', value);
    uiLang.val = value;
    AppTranslation().changeLocale(value);
    print('current locale $Get.locale');
  }
}
