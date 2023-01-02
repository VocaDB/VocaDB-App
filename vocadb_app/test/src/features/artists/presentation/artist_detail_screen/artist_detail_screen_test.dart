import 'package:flutter_test/flutter_test.dart';

import '../../artist_robot.dart';

void main() {
  testWidgets('artist detail screen ...', (tester) async {
    // TODO: Implement test
    final r = ArtistRobot(tester);
    await r.pumpArtistDetailScreen();
  });
}
