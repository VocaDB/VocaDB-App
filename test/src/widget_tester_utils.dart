import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class WidgetTesterUtils {
  final WidgetTester tester;

  WidgetTesterUtils(this.tester);

  Future<void> pumpMaterialWidgetWithProvider(Widget widget) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: widget,
          ),
        ),
      ),
    );
  }

  Finder findRadioListTileWithValueIs(String value) {
      return find.byWidgetPredicate((widget) => widget is RadioListTile && widget.value == value);
  }
  Finder findCheckedRadioListTileWithValueIs(String value) {
      return find.byWidgetPredicate((widget) => widget is RadioListTile && widget.value == value && widget.checked);
  }
  Finder findUncheckedRadioListTileWithValueIsNot(String value) {
      return find.byWidgetPredicate((widget) => widget is RadioListTile && widget.value != value && !widget.checked);
  }
}
