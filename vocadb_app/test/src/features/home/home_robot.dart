import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/home/presentation/home_screen/home_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/main_screen/main_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/menu_screen/menu_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_screen.dart';

class HomeRobot {
  final WidgetTester tester;

  HomeRobot(this.tester);

  Future<void> pumpMainScreen() async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: MainScreen(),
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
