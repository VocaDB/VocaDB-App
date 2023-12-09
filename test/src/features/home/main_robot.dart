import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/albums/data/album_repository.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/home/presentation/home_screen/home_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/main_screen/main_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/menu_screen/menu_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_screen.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_repository.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainRobot {
  final WidgetTester tester;

  MainRobot(this.tester);

  Future<void> pumpMainScreen({
    SongRepository? songRepository,
    AlbumRepository? albumRepository,
    ReleaseEventRepository? releaseEventRepository,
    AuthRepository? authRepository,
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (songRepository != null)
            songRepositoryProvider.overrideWithValue(songRepository),
          if (albumRepository != null)
            albumRepositoryProvider.overrideWithValue(albumRepository),
          if (releaseEventRepository != null)
            releaseEventRepositoryProvider
                .overrideWithValue(releaseEventRepository),
          if (authRepository != null)
            authRepositoryProvider.overrideWithValue(authRepository),
        ],
        child: const MaterialApp(
          home: MainScreen(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
  }

  Future<void> expectHomeScreenVisible(bool isVisible) async {
    final finder = find.byType(HomeScreen);
    (isVisible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectRankingScreenVisible(bool isVisible) async {
    final finder = find.byType(RankingScreen);
    (isVisible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectMenuScreenVisible(bool isVisible) async {
    final finder = find.byType(MenuScreen);
    (isVisible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> selectHomeTab() async {
    final finder = find.byKey(MainScreen.tabHomeKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pump();
  }

  Future<void> selectRankingTab() async {
    final finder = find.byKey(MainScreen.tabRankingKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pump();
  }

  Future<void> selectMenuTab() async {
    final finder = find.byKey(MainScreen.tabMenuKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pump();
  }
}
