import 'package:flutter_test/flutter_test.dart';

import '../../entry_robot.dart';

void main() {
  testWidgets('entries search screen ...', (tester) async {
    // TODO: Implement test
    final r = EntryRobot(tester);
    await r.pumpEntriesSearchScreen();
  });
}
