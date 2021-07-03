import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Themes
class Themes {
  static final dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static void changeTheme(String value) {
    print('Get.changeTheme to $value');
    Get.changeThemeMode((value == 'light') ? ThemeMode.light : ThemeMode.dark);
  }
}
