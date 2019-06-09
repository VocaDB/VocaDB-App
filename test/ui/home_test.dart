import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:vocadb/ui/home.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {

  group('Home widget test', () {

    testWidgets('Initial display correctly', (WidgetTester tester) async {
      provideMockedNetworkImages(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Home(),
          ),
        );
        expect(find.text('Highlighted'), findsOneWidget);
      });
    });

  });
}
