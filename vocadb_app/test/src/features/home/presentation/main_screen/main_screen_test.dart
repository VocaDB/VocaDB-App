import 'package:flutter_test/flutter_test.dart';

import '../../home_robot.dart';

void main() {
  testWidgets('Main screen switch tab correctly', (tester) async {
    final r = HomeRobot(tester);
    await r.pumpMainScreen();
    await r.expectHomeScreenVisible(true);
    await r.expectRankingScreenVisible(false);
    await r.expectMenuScreenVisible(false);

    await r.selectRankingTab();
    await r.expectHomeScreenVisible(false);
    await r.expectRankingScreenVisible(true);
    await r.expectMenuScreenVisible(false);

    await r.selectMenuTab();
    await r.expectHomeScreenVisible(false);
    await r.expectRankingScreenVisible(false);
    await r.expectMenuScreenVisible(true);
  });
}
