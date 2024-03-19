import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/users/presentation/rated_songs_screen/rated_songs_filter_screen.dart';
import 'package:vocadb_app/src/features/users/presentation/rated_songs_screen/rated_songs_screen.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_content.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/widgets.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_tile/song_tile.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_derived_list_view.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_related_list_view.dart';
import 'package:vocadb_app/src/features/users/data/user_repository.dart';
import 'package:vocadb_app/src/routing/app_router.dart';
import 'package:vocadb_app/src/utils/share_launcher.dart';
import 'package:vocadb_app/src/utils/url_launcher.dart';

class SongRobot {
  final WidgetTester tester;

  SongRobot(this.tester);

  Future<void> pumpSongDetailScreen({
    SongRepository? songRepository,
    AuthRepository? authRepository,
    UrlLauncher? urlLauncher,
    ShareLauncher? shareLauncher,
    required int songId,
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (songRepository != null)
            songRepositoryProvider.overrideWithValue(songRepository),
          if (authRepository != null)
            authRepositoryProvider.overrideWithValue(authRepository),
          if (urlLauncher != null)
            urlLauncherProvider.overrideWithValue(urlLauncher),
          if (shareLauncher != null)
            shareLauncherProvider.overrideWithValue(shareLauncher),
        ],
        child: MaterialApp(
          home: SongDetailScreen(
            song: Song(id: songId),
            pvPlayerWidget: const Text('Mock Player Widget'),
          ),
        ),
      ),
    );
    // await tester.pumpAndSettle(const Duration(seconds: 10));
    await tester.pump();
  }

  Future<void> pumpSongDerivedListView({
    SongRepository? songRepository,
    AuthRepository? authRepository,
    required int songId,
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (songRepository != null)
            songRepositoryProvider.overrideWithValue(songRepository),
          if (authRepository != null)
            authRepositoryProvider.overrideWithValue(authRepository),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                SongsDerivedListView(songId: songId),
              ],
            ),
          ),
        ),
      ),
    );
    // await tester.pumpAndSettle(const Duration(seconds: 10));
  }

  Future<void> pumpRatedSongsListScreen({
    SongRepository? songRepository,
    UserRepository? userRepository,
    AuthRepository? authRepository,
    UserSettingsRepository? userSettingsRepository,
  }) async {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const RatedSongsScreen(),
          routes: [
            GoRoute(
              path: 'filter',
              name: AppRoute.userRatedSongFilter.name,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                fullscreenDialog: true,
                child: const RatedSongsFilterScreen(),
              ),
            ),
          ],
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (songRepository != null)
            songRepositoryProvider.overrideWithValue(songRepository),
          if (userRepository != null)
            userRepositoryProvider.overrideWithValue(userRepository),
          if (authRepository != null)
            authRepositoryProvider.overrideWithValue(authRepository),
          if (userSettingsRepository != null)
            userSettingsRepositoryProvider
                .overrideWithValue(userSettingsRepository),
        ],
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );
    // await tester.pumpAndSettle(const Duration(seconds: 10));
    await tester.pump();
  }

  Future<void> pumpSongRelatedListView(
      {SongRepository? songRepository,
      AuthRepository? authRepository,
      required int songId}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (songRepository != null)
            songRepositoryProvider.overrideWithValue(songRepository),
          if (authRepository != null)
            authRepositoryProvider.overrideWithValue(authRepository),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                SongsRelatedListView(songId: songId),
              ],
            ),
          ),
        ),
      ),
    );
    // await tester.pumpAndSettle(const Duration(seconds: 10));
  }

  Future<void> expectRatedSongDisplayCountAtLeast(int count) async {
    final finder = find.byType(SongTile);
    expect(finder, findsAtLeastNWidgets(count));
  }

  Future<void> tapIconFilterRatedSongs() async {
    final finder = find.byKey(RatedSongsScreen.filterKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pump();
  }

  Future<void> selectRating(String rating) async {
    await tester.pump();
    final finder = find.byKey(RatedSongsFilterScreen.ratingKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();

    final selectedFinder = find.text(rating).last;
    expect(selectedFinder, findsOneWidget);
    await tester.tap(selectedFinder);
    await tester.pump();
  }

  Future<void> selectSort(String sort) async {
    await tester.pump();
    final finder = find.byKey(RatedSongsFilterScreen.sortKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();

    final selectedFinder = find.text(sort).last;
    expect(selectedFinder, findsOneWidget);
    await tester.tap(selectedFinder);
    await tester.pump();
  }

  Future<void> tapCloseFilterScreen() async {
    final finder = find.byIcon(Icons.close);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pump();
  }

  Future<void> tapMoreInfo() async {
    final finder = find.byKey(SongDetailButtonBar.infoBtnKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pump();
  }

  Future<void> tapShare() async {
    final finder = find.byKey(SongDetailButtonBar.shareBtnKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pump();
  }

  Future<void> expectSongInfoContentVisible(bool visible) async {
    final finder = find.byType(SongDetailContent);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectSongLyricContentVisible(bool visible) async {
    final finder = find.byType(LyricContent);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectLyricButtonVisible(bool visible) async {
    final finder = find.byKey(SongDetailButtonBar.lyricBtnKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> tapLyricButton() async {
    final finder = find.byKey(SongDetailButtonBar.lyricBtnKey);
    expect(finder, findsOneWidget);

    await tester.tap(finder);
    await tester.pump();
  }

  Future<void> tapCloseLyricButton() async {
    final finder = find.byKey(LyricContent.iconCloseKey);
    expect(finder, findsOneWidget);

    await tester.tap(finder);
    await tester.pump();
  }

  Future<void> expectTagsVisible(bool visible) async {
    final finder = find.byKey(SongDetailScreen.tagsKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectArtistsVisible(bool visible) async {
    final finder = find.byKey(SongDetailScreen.artistsKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectPVsVisible(bool visible) async {
    final finder = find.byKey(SongDetailScreen.pvsKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> scrollDown({double offset = -800}) async {
    await tester.drag(find.byType(ListView).first, Offset(0, offset));
    await tester.pump();
  }

  Future<void> expectAlbumsVisible(bool visible) async {
    final finder = find.byKey(SongDetailScreen.albumsKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectAltSongsVisible(bool visible) async {
    final finder = find.byKey(SongsDerivedListView.altSongsKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectReleaseEventsVisible(bool visible) async {
    final finder = find.byKey(SongDetailScreen.releaseEventsKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectSameLikeSongsVisible(bool visible) async {
    final finder = find.byKey(SongsRelatedListView.sameLikedSongsKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectWebLinksVisible(bool visible) async {
    final finder = find.byKey(SongDetailScreen.webLinksKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }
}
