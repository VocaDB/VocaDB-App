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
        name: Routes.RELEASE_EVENTS_DETAIL,
        page: () => ReleaseEventDetailPage()),
    GetPage(
        name: Routes.RELEASE_EVENT_SERIES_DETAIL,
        page: () => ReleaseEventSeriesDetailPage()),
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
    GetPage(name: Routes.ALBUMS_DETAIL, page: () => AlbumDetailPage()),
    GetPage(
        name: Routes.TAGS,
        page: () => TagSearchPage(),
        binding: TagSearchBinding()),
    GetPage(name: Routes.TAG_CATEGORIES, page: () => TagCategoryPage()),
    GetPage(name: Routes.TAGS_DETAIL, page: () => TagDetailPage()),
    GetPage(
        name: Routes.ENTRIES,
        page: () => EntrySearchPage(),
        binding: EntrySearchBinding()),
    GetPage(
        name: Routes.FAVORITE_SONGS,
        page: () => FavoriteSongPage(),
        binding: FavoriteSongBinding()),
    GetPage(
        name: Routes.FAVORITE_ARTISTS,
        page: () => FavoriteArtistPage(),
        binding: FavoriteArtistBinding()),
    GetPage(
        name: Routes.FAVORITE_ALBUMS,
        page: () => FavoriteAlbumPage(),
        binding: FavoriteAlbumBinding()),
  ];

  static toSongDetailPage(SongModel song) {
    Get.toNamed('/songs/${song.id}',
        arguments: SongDetailArgs(id: song.id, song: song));
  }

  static toArtistDetailPage(ArtistModel artist) {
    Get.toNamed('/artists/${artist.id}',
        arguments: ArtistDetailArgs(id: artist.id, artist: artist));
  }

  static toAlbumDetailPage(AlbumModel album) {
    Get.toNamed('/albums/${album.id}',
        arguments: AlbumDetailArgs(id: album.id, album: album));
  }

  static toTagDetailPage(TagModel tag) {
    Get.toNamed('/tags/${tag.id}',
        arguments: TagDetailArgs(id: tag.id, tag: tag));
  }

  static toReleaseEventDetailPage(ReleaseEventModel event) {
    Get.toNamed('/release-events/${event.id}',
        arguments: ReleaseEventDetailArgs(id: event.id, event: event));
  }

  static toReleaseEventSeriesDetailPage(ReleaseEventSeriesModel event) {
    Get.toNamed('/release-event-series/${event.id}',
        arguments:
            ReleaseEventSeriesDetailArgs(id: event.id, eventSeries: event));
  }

  static openPVPlayListPage(List<SongModel> songs,
      {String title = 'Playlist'}) {
    Get.to(PVPlaylistPage(),
        arguments: PVPlayListArgs(songs: songs, title: title));
  }
}
