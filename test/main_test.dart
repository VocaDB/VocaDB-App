// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:vocadb/main.dart';

void main() {

  group('Main widget test', () {
    testWidgets('Bottom navigator should switched correctly', (WidgetTester tester) async {

      await tester.pumpWidget(MyApp());

      expect(find.text('Home tab'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.trending_up));
      await tester.pump();

      expect(find.text('Home tab'), findsNothing);
      expect(find.text('Ranking tab'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.account_circle));
      await tester.pump();

      expect(find.text('Ranking tab'), findsNothing);
      expect(find.text('Account tab'), findsOneWidget);

    });
  });
}
