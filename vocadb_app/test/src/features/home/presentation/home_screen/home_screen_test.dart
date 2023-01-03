import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import 'home_robot.dart';

void main() {
  testWidgets('home screen ...', (tester) async {
    final r = HomeRobot(tester);
    final songRepository = MockSongRepository();

    await r.pumpHomeScreen(songRepository: songRepository);

    verify(songRepository.fetchSongsHighlighted).called(1);
  });
}
