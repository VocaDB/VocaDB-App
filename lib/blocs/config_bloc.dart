import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vocadb/app_theme.dart';

class ConfigBloc {
  BehaviorSubject<ThemeEnum> _themeData =
      new BehaviorSubject.seeded(ThemeEnum.Dark);

  Observable get themeDataStream => _themeData.stream;

  ConfigBloc() {
    _themeData.add(ThemeEnum.Dark);
  }

  void dispose() {
    _themeData.close();
  }

  void updateTheme(ThemeEnum selectedTheme) {
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
