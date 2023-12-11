import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_filter_filter_by_radio_group.dart';

import '../../../../widget_tester_utils.dart';

void main() {

  group('RankingFilterFilterByRadioGroup', () { 

    final filterByValues = ['CreateDate', 'PublishDate', 'Popularity'];

    testWidgets('Render correctly with default option is checked', (tester) async {
      final widgetTesterUtils = WidgetTesterUtils(tester);
      await widgetTesterUtils.pumpMaterialWidgetWithProvider(const RankingFilterFilterByRadioGroup());

      await tester.pump();
      expect(find.text('Newly added'), findsOneWidget);
      expect(find.text('Newly published'), findsOneWidget);
      expect(find.text('Popularity'), findsOneWidget);
      expect(widgetTesterUtils.findCheckedRadioListTileWithValueIs('CreateDate'), findsOneWidget);
    });

    // Test Data Driven 
    for(final filterByValue in filterByValues) {
        testWidgets('Radio option is checked when user tap $filterByValue', (tester) async {
          final widgetTesterUtils = WidgetTesterUtils(tester);
          await widgetTesterUtils.pumpMaterialWidgetWithProvider(const RankingFilterFilterByRadioGroup());

          await tester.tap(widgetTesterUtils.findRadioListTileWithValueIs(filterByValue));
          await tester.pump();

          expect(widgetTesterUtils.findCheckedRadioListTileWithValueIs(filterByValue), findsOneWidget);
          expect(widgetTesterUtils.findUncheckedRadioListTileWithValueIsNot(filterByValue), findsNWidgets(2));
        });
    }
  });

}