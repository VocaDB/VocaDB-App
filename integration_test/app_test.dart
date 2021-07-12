import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:vocadb_app/main.dart' as app;

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("full app test", (WidgetTester tester) async {
      await app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(Key('songShortcut')), findsWidgets);
      expect(find.byKey(Key('artistShortcut')), findsWidgets);
      expect(find.byKey(Key('albumShortcut')), findsWidgets);
      expect(find.byKey(Key('tagShortcut')), findsWidgets);
      expect(find.byKey(Key('eventShortcut')), findsWidgets);
    });
  });
}
