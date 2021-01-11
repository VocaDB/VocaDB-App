import 'dart:ui';

import 'package:get/get.dart';
import 'package:vocadb_app/src/config/lang/en_us.dart';
import 'package:vocadb_app/src/config/lang/ja_jp.dart';

class AppTranslation extends Translations {
  static final fallbackLocale = Locale('en', 'US');

  /// Supported locales
  static final locales = {
    'en_US': Locale('en', 'US'),
    'ja_JP': Locale('ja', 'JP'),
    'th_TH': Locale('th', 'TH'),
    'ms_MY': Locale('ms', 'MY'),
  };

  @override
  Map<String, Map<String, String>> get keys => {'en_US': enUS, 'ja_JP': jaJP};

  /// Gets locale from locales, and updates the locale
  void changeLocale(String lang) {
    Get.updateLocale(locales[lang]);
  }
}
