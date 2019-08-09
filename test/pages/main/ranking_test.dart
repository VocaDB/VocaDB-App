import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/pages/main/ranking_tab.dart';

void main() {

  group('Ranking widget test', () {
    testWidgets('Initial display correctly', (WidgetTester tester) async {

      await tester.pumpWidget(RankingTab());

      expect(find.text('Ranking tab'), findsOneWidget);

    });
  });
}
