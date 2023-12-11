import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_filter_filter_by_radio_group.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_filter_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_filter_vocalist_radio_group.dart';

import '../../../../widget_tester_utils.dart';

void main() {
  testWidgets('RankingFilterScreen render correctly', (tester) async {
      final widgetTesterUtils = WidgetTesterUtils(tester);
      await widgetTesterUtils.pumpMaterialWidgetWithProvider(const RankingFilterScreen());
      expect(find.byType(RankingFilterFilterByRadioGroup), findsOneWidget);
      expect(find.byType(RankingFilterVocalistRadioGroup), findsOneWidget);
  });
}