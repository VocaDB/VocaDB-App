import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/ui/account.dart';

void main() {

  group('Account widget test', () {
    testWidgets('Initial display correctly', (WidgetTester tester) async {

      await tester.pumpWidget(Account());

      expect(find.text('Account tab'), findsOneWidget);

    });
  });
}
