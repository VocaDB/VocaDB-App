import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import 'home_robot.dart';

void main() {
  testWidgets('home screen ...', (tester) async {
    final r = HomeRobot(tester);
    final songRepository = MockSongRepository();
    final albumRepository = MockAlbumRepository();
    final releaseEventRepository = MockReleaseEventRepository();

    await r.pumpHomeScreen(
      songRepository: songRepository,
      albumRepository: albumRepository,
      releaseEventRepository: releaseEventRepository,
    );

    await r.scrollDown();

    verify(songRepository.fetchSongsHighlighted).called(1);
    verify(albumRepository.fetchNew).called(1);
    verify(albumRepository.fetchTop).called(1);
    verify(releaseEventRepository.fetchRecentEvents).called(1);
  });
}
