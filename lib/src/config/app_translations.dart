import 'dart:ui';

import 'package:get/get.dart';
import 'package:vocadb_app/i18n.dart';

class AppTranslation extends Translations {
  static final fallbackLocale = Locale('en');

  /// Supported locales
  static final locales = {
    'en': Locale('en'),
    'ja': Locale('ja'),
    'th': Locale('th'),
    'ms': Locale('ms'),
    'zh': Locale('zh'),
  };

  @override
  Map<String, Map<String, String>> get keys =>
      {'en': en, 'ja': ja, 'th': th, 'ms': ms, 'zh': zh};

  /// Gets locale from locales, and updates the locale
  void changeLocale(String lang) => Get.updateLocale(locales[lang]);
}
