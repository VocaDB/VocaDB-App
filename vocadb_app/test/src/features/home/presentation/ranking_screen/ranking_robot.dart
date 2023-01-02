import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_screen.dart';

class RankingRobot {
  final WidgetTester tester;

  RankingRobot(this.tester);

  Future<void> pumpRankingScreen() async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: RankingScreen(),
        ),
      ),
    );
    await tester.pump();
  }
}
