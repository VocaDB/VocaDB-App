import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocadb/app_theme.dart';
import 'package:vocadb/services/web_service.dart';

class GlobalVariables {
  static SharedPreferences pref;

  static RestApi restApi;

  static ThemeEnum defaultTheme;

  static init() async {
    pref = await SharedPreferences.getInstance();
    restApi = RestApi();
    defaultTheme = AppTheme.toEnum(pref.get('theme'));
  }
}
