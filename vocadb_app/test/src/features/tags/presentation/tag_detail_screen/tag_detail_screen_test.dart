import 'package:flutter_test/flutter_test.dart';

import '../../tag_robot.dart';

void main() {
  testWidgets('tag detail screen ...', (tester) async {
    final r = TagRobot(tester);
    await r.pumpTagDetailScreen();
  });
}
