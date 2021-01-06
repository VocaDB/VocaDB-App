import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/bindings.dart';
import 'package:vocadb_app/models.dart';
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
    GetPage(name: Routes.SONGS_DETAIL, page: () => SongDetailPage()),
    GetPage(
        name: Routes.ARTISTS,
        page: () => ArtistSearchPage(),
        binding: ArtistSearchBinding()),
    GetPage(name: Routes.ARTISTS_DETAIL, page: () => ArtistDetailPage()),
    GetPage(
        name: Routes.RELEASE_EVENTS,
        page: () => ReleaseEventSearchPage(),
        binding: ReleaseEventSearchBinding()),
    GetPage(
        name: Routes.ARTISTS_SELECTOR,
        page: () => ArtistSearchPage(
              enableFilter: false,
              selectionMode: true,
            ),
        binding: ArtistSearchBinding()),
    GetPage(
        name: Routes.ALBUMS,
        page: () => AlbumSearchPage(),
        binding: AlbumSearchBinding()),
    GetPage(
        name: Routes.TAGS,
        page: () => TagSearchPage(),
        binding: TagSearchBinding()),
    GetPage(name: Routes.TAG_CATEGORIES, page: () => TagCategoryPage()),
    GetPage(
        name: Routes.ENTRIES,
        page: () => EntrySearchPage(),
        binding: EntrySearchBinding()),
  ];

  static toSongDetailPage(SongModel song) {
    Get.toNamed('/songs/${song.id}',
        arguments: SongDetailArgs(id: song.id, song: song));
  }

  static toArtistDetailPage(ArtistModel artist) {
    Get.toNamed('/artists/${artist.id}',
        arguments: ArtistDetailArgs(id: artist.id, artist: artist));
  }
}
