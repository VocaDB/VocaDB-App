import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/ui/ranking.dart';

void main() {

  group('Ranking widget test', () {
    testWidgets('Initial display correctly', (WidgetTester tester) async {

      await tester.pumpWidget(Ranking());

      expect(find.text('Ranking tab'), findsOneWidget);

    });
  });
}
