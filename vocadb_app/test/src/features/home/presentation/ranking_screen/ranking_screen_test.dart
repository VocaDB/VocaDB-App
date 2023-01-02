import 'package:flutter_test/flutter_test.dart';

import 'ranking_robot.dart';

void main() {
  testWidgets('ranking screen ...', (tester) async {
    final r = RankingRobot(tester);
    await r.pumpRankingScreen();
  });
}
