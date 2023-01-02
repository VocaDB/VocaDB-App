import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/home/presentation/home_screen/home_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/menu_screen/menu_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_screen.dart';

class MenuRobot {
  final WidgetTester tester;

  MenuRobot(this.tester);

  Future<void> pumpMenuScreen({AuthRepository? authRepository}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (authRepository != null)
            authRepositoryProvider.overrideWithValue(authRepository)
        ],
        child: const MaterialApp(
          home: MenuScreen(),
        ),
      ),
    );
    await tester.pump();
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

  Future<void> expectMenuLoginVisible(bool isVisible) async {
    final finder = find.byKey(MenuScreen.menuLoginKey);
    (isVisible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectMenuAccountVisible(bool isVisible) async {
    final finder = find.byKey(MenuScreen.menuAccountKey);
    (isVisible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectMenuMySongsVisible(bool isVisible) async {
    final finder = find.byKey(MenuScreen.menuMySongsKey);
    (isVisible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectMenuMyArtistsVisible(bool isVisible) async {
    final finder = find.byKey(MenuScreen.menuMyArtistsKey);
    (isVisible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectMenuMyAlbumsVisible(bool isVisible) async {
    final finder = find.byKey(MenuScreen.menuMyAlbumsKey);
    (isVisible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectMenuSettingsVisible(bool isVisible) async {
    final finder = find.byKey(MenuScreen.menuSettingsKey);
    (isVisible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectMenuContactVisible(bool isVisible) async {
    final finder = find.byKey(MenuScreen.menuContactKey);
    (isVisible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectMenuAboutVisible(bool isVisible) async {
    final finder = find.byKey(MenuScreen.menuAboutKey);
    (isVisible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }
}
