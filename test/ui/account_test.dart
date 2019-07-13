import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/ui/account_tab.dart';

void main() {

  group('Account widget test', () {
    testWidgets('Initial display correctly', (WidgetTester tester) async {

      await tester.pumpWidget(AccountTab());

      expect(find.text('Account tab'), findsOneWidget);

    });
  });
}
