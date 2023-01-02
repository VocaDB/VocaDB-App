import 'package:flutter_test/flutter_test.dart';

import '../../song_robot.dart';

void main() {
  testWidgets('song detail screen ...', (tester) async {
    // TODO: Implement test
    final r = SongRobot(tester);
    await r.pumpSongDetailScreen();
  });
}
