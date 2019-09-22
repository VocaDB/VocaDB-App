import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vocadb/app_theme.dart';
import 'package:vocadb/global_variables.dart';

class ConfigBloc {
  BehaviorSubject<ThemeEnum> _themeData = new BehaviorSubject.seeded(
      GlobalVariables.defaultTheme ?? AppTheme.darkTheme);

  Observable get themeDataStream => _themeData.stream;

  ConfigBloc() {
    initTheme();
  }
  void dispose() {
    _themeData.close();
  }

  void initTheme() async {
    String t = GlobalVariables.pref.getString('theme');
    if (t == ThemeEnum.Light.toString()) {
      updateTheme(ThemeEnum.Light);
    } else {
      updateTheme(ThemeEnum.Dark);
    }
  }

  void updateTheme(ThemeEnum selectedTheme) async {
    print(selectedTheme.toString());
    await GlobalVariables.pref.setString('theme', selectedTheme.toString());
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
