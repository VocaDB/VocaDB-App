import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocadb/app_theme.dart';
import 'package:vocadb/services/web_service.dart';

class GlobalVariables {
  static SharedPreferences pref;

  static RestService restService;

  static ThemeEnum defaultTheme;

  static init() async {
    pref = await SharedPreferences.getInstance();
    restService = RestService();
    defaultTheme = AppTheme.toEnum(pref.get('theme'));
  }
}
