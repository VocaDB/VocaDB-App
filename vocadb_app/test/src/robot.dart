import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/app.dart';

class Robot {
  final WidgetTester tester;

  const Robot(this.tester);

  Future<void> pumpMyApp() async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );
  }
}
