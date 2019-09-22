import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocadb/app_theme.dart';

class GlobalVariables {
  static SharedPreferences pref;

  static ThemeEnum defaultTheme;

  static init() async {
    pref = await SharedPreferences.getInstance();
    defaultTheme = AppTheme.toEnum(pref.get('theme'));
  }
}
