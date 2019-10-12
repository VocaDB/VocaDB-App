import 'package:flutter/material.dart';

enum ThemeEnum { Dark, Light }

class AppTheme {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
  );

  static ThemeEnum toEnum(String name) {
    if (name == ThemeEnum.Light.toString()) return ThemeEnum.Light;

    return ThemeEnum.Dark;
  }
}
