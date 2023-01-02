import 'package:flutter_test/flutter_test.dart';

import '../../album_robot.dart';

void main() {
  testWidgets('album detail screen ...', (tester) async {
    // TODO: Implement test
    final r = AlbumRobot(tester);
    await r.pumpAlbumDetailScreen();
  });
}
