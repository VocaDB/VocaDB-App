import 'package:flutter_test/flutter_test.dart';

import 'home_robot.dart';

void main() {
  testWidgets('home screen ...', (tester) async {
    // TODO: Implement test
    final r = HomeRobot(tester);
    await r.pumpHomeScreen();
  });
}
