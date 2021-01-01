import 'package:get/get.dart';
import 'package:vocadb_app/bindings.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => LoginPage()),
    GetPage(
        name: Routes.MAIN, page: () => MainPage(), binding: MainPageBinding()),
  ];
}
