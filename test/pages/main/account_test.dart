import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/pages/main/account_tab.dart';

void main() {
  group('Account widget test', () {
    testWidgets('Display AccountTab widget correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Material(child: AccountTab())));

      expect(find.text("Setting"), findsOneWidget);
    });
  });
}
