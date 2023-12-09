import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'search_appbar_robot.dart';

void main() {
  group('SearchAppBar', () {
    testWidgets('with default state', (tester) async {
      final r = SearchAppBarRobot(tester);

      await r.pumpSearchAppBar();

      await r.expectTextFieldIsNotVisible();
      await r.expectIconClearIsNotVisible();
      await r.expectIconSearchIsVisible();
    });

    testWidgets('with actions', (tester) async {
      final r = SearchAppBarRobot(tester);
      const newActionKey = Key('new-action');

      await r.pumpSearchAppBar(actions: [
        IconButton(
          key: newActionKey,
          icon: const Icon(Icons.tune),
          onPressed: () {},
        )
      ]);

      final finder = find.byKey(newActionKey);
      expect(finder, findsOneWidget);
    });

    testWidgets('with show text field state and type text and click clear',
        (tester) async {
      bool onChangedTriggered = false;
      bool onClearedTriggerd = false;
      final r = SearchAppBarRobot(tester);

      await r.pumpSearchAppBar(
          showTextInput: true,
          onChanged: (value) {
            onChangedTriggered = true;
          },
          onCleared: () {
            onClearedTriggerd = true;
          });

      await r.expectTextFieldIsVisible();
      await r.expectIconClearIsVisible();
      await r.expectIconSearchIsNotVisible();

      await r.enterSearchText('q');
      expect(onChangedTriggered, isTrue);

      await r.tapIconClear();
      expect(onClearedTriggerd, isTrue);
    });
  });
}
