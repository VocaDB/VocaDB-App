import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_screen.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';

class RankingRobot {
  final WidgetTester tester;

  RankingRobot(this.tester);

  Future<void> pumpRankingScreen({SongRepository? songRepository}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (songRepository != null)
            songRepositoryProvider.overrideWithValue(songRepository)
        ],
        child: const MaterialApp(
          home: RankingScreen(),
        ),
      ),
    );
    await tester.pump();
  }

  Future<void> tapDaily() async {
    final finder = find.byKey(RankingScreen.tabDailyKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> tapWeekly() async {
    final finder = find.byKey(RankingScreen.tabWeeklyKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> tapMonthly() async {
    final finder = find.byKey(RankingScreen.tabMonthlyKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> tapOverall() async {
    final finder = find.byKey(RankingScreen.tabOverallKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }
}
