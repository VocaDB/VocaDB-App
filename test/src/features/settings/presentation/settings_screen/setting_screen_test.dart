import 'package:flutter_test/flutter_test.dart';

import '../../settings_robot.dart';

void main() {
  testWidgets('settings screen ...', (tester) async {
    final r = SettingsRobot(tester);
    await r.pumpSettingsScreen();
  });
}
