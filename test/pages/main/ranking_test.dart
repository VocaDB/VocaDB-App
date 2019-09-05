import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/pages/main/ranking_tab.dart';

void main() {
  group('Ranking widget test', () {
    testWidgets('Display RankingTab widget correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Material(child: RankingTab())));

      expect(find.text("Weekly"), findsOneWidget);
    });
  });
}
