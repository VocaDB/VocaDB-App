import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/common_widgets/search_appbar.dart';

class SearchAppBarRobot {
  final WidgetTester tester;

  SearchAppBarRobot(this.tester);

  Future<void> pumpSearchAppBar({
    bool showTextInput = false,
    Function(String)? onChanged,
    VoidCallback? onCleared,
    List<Widget>? actions,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: SearchAppBar(
            showTextInput: showTextInput,
            onChanged: onChanged,
            onCleared: onCleared,
            actions: actions,
          ),
        ),
      ),
    );
  }

  Future<void> enterSearchText(String text) async {
    final finder = find.byType(TextField);
    expect(finder, findsOneWidget);
    await tester.enterText(finder, text);
    await tester.pump();
  }

  Future<void> tapIconClear() async {
    final finder = find.byKey(SearchAppBar.iconClearKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pump();
  }

  Future<void> expectTextFieldIsVisible() async {
    final finder = find.byType(TextField);
    expect(finder, findsOneWidget);
  }

  Future<void> expectTextFieldIsNotVisible() async {
    final finder = find.byType(TextField);
    expect(finder, findsNothing);
  }

  Future<void> expectIconSearchIsVisible() async {
    final finder = find.byKey(SearchAppBar.iconSearchKey);
    expect(finder, findsOneWidget);
  }

  Future<void> expectIconSearchIsNotVisible() async {
    final finder = find.byKey(SearchAppBar.iconSearchKey);
    expect(finder, findsNothing);
  }

  Future<void> expectIconClearIsVisible() async {
    final finder = find.byKey(SearchAppBar.iconClearKey);
    expect(finder, findsOneWidget);
  }

  Future<void> expectIconClearIsNotVisible() async {
    final finder = find.byKey(SearchAppBar.iconClearKey);
    expect(finder, findsNothing);
  }

  Future<void> expectTextTitleIsVisible() async {
    final finder = find.byKey(SearchAppBar.textTitleKey);
    expect(finder, findsOneWidget);
  }

  Future<void> expectTextTitleIsNotVisible() async {
    final finder = find.byKey(SearchAppBar.textTitleKey);
    expect(finder, findsNothing);
  }
}
