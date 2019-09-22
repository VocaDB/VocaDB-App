import 'package:flutter/material.dart';

enum ThemeEnum { Dark, Light }

class AppTheme {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
  );
}
