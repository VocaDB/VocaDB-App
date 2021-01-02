import 'package:get/get.dart';
import 'package:vocadb_app/bindings.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => LoginPage()),
    GetPage(
        name: Routes.MAIN, page: () => MainPage(), binding: MainPageBinding()),
    GetPage(
        name: Routes.SONGS,
        page: () => SongSearchPage(),
        binding: SongSearchBinding()),
    GetPage(
        name: Routes.ARTISTS,
        page: () => ArtistSearchPage(),
        binding: ArtistSearchBinding()),
    GetPage(
        name: Routes.ARTISTS_SELECTOR,
        page: () => ArtistSearchPage(
              enableFilter: false,
              selectionMode: true,
            ),
        binding: ArtistSearchBinding())
  ];
}
