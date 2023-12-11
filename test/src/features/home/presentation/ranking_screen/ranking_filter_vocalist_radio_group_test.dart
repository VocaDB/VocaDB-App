import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_filter_vocalist_radio_group.dart';

import '../../../../widget_tester_utils.dart';

void main() {
  group('RankingFilterVocalistRadioGroup', () { 

    final vocalistValues = ['Nothing', 'Vocaloid', 'UTAU', 'Other'];

    testWidgets('Render correctly with default option is checked', (tester) async {
      final widgetTesterUtils = WidgetTesterUtils(tester);
      await widgetTesterUtils.pumpMaterialWidgetWithProvider(const RankingFilterVocalistRadioGroup());

      await tester.pump();
      expect(find.text('All vocalists'), findsOneWidget);
      expect(find.text('Only Vocaloid'), findsOneWidget);
      expect(find.text('UTAU'), findsOneWidget);
      expect(find.text('Other'), findsOneWidget);
      expect(widgetTesterUtils.findCheckedRadioListTileWithValueIs('Nothing'), findsOneWidget);
    });

    // Test Data Driven 
    for(final vocalistValue in vocalistValues) {
        testWidgets('Radio option is checked when user tap $vocalistValue', (tester) async {
          final widgetTesterUtils = WidgetTesterUtils(tester);
          await widgetTesterUtils.pumpMaterialWidgetWithProvider(const RankingFilterVocalistRadioGroup());

          await tester.tap(widgetTesterUtils.findRadioListTileWithValueIs(vocalistValue));
          await tester.pump();

          expect(widgetTesterUtils.findCheckedRadioListTileWithValueIs(vocalistValue), findsOneWidget);
          expect(widgetTesterUtils.findUncheckedRadioListTileWithValueIsNot(vocalistValue), findsNWidgets(3));
        });
    }
  });

}