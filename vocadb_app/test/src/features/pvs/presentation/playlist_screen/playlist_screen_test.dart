import 'package:flutter_test/flutter_test.dart';

import '../../pv_robot.dart';

void main() {
  testWidgets('playlist screen ...', (tester) async {
    // TODO: Implement test
    final r = PVRobot(tester);
    await r.pumpPlaylistScreen();
  });
}
