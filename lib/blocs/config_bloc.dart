import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocadb/app_theme.dart';

class ConfigBloc {
  BehaviorSubject<ThemeEnum> _themeData = new BehaviorSubject.seeded(ThemeEnum.Dark);
  BehaviorSubject<String> _contentLang = new BehaviorSubject.seeded('Default');

  Observable get themeDataStream => _themeData.stream;
  Observable get contentLangStream => _contentLang.stream;

  final SharedPreferences pref;

  ConfigBloc(this.pref) {
    initTheme();
    initContentLnaguage();
  }

  void dispose() {
    _contentLang.close();
    _themeData.close();
  }

  void initTheme() async {
    String t = pref.getString('theme');
    if (t == ThemeEnum.Light.toString()) {
      updateTheme(ThemeEnum.Light);
    } else {
      updateTheme(ThemeEnum.Dark);
    }
  }

  void initContentLnaguage() {
    String value = pref.getString('content_language') ?? 'Default';
    updateContentLanguage(value);
  }

  void updateContentLanguage(String lang) {
    pref.setString('content_language', lang);
    _contentLang.add(lang);
  }

  void updateTheme(ThemeEnum selectedTheme) async {
    pref.setString('theme', selectedTheme.toString());
    _themeData.add(selectedTheme);
  }

  ThemeData getThemeData(ThemeEnum t) {
    switch (t) {
      case ThemeEnum.Dark:
        return AppTheme.darkTheme;
      case ThemeEnum.Light:
        return AppTheme.lightTheme;
      default:
        return AppTheme.darkTheme;
    }
  }
}
