import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:vocadb/main.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {

  group('Main widget test', () {
    testWidgets('Bottom navigator should switched correctly', (WidgetTester tester) async {

      provideMockedNetworkImages(() async {
        await tester.pumpWidget(MyApp());

        expect(find.text('Highlighted'), findsOneWidget);

        await tester.tap(find.byIcon(Icons.trending_up));
        await tester.pump();

        expect(find.text('Highlighted'), findsNothing);
        expect(find.text('Weekly'), findsOneWidget);

        await tester.tap(find.byIcon(Icons.account_circle));
        await tester.pump();

        expect(find.text('Weekly'), findsNothing);
        expect(find.text('Setting'), findsOneWidget);
      });



    });
  });
}
