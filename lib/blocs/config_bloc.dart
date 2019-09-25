import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocadb/app_theme.dart';

class ConfigBloc {
  BehaviorSubject<ThemeEnum> _themeData = new BehaviorSubject.seeded(ThemeEnum.Dark);

  Observable get themeDataStream => _themeData.stream;

  final SharedPreferences pref;

  ConfigBloc(this.pref) {
    initTheme();
  }

  void dispose() {
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
