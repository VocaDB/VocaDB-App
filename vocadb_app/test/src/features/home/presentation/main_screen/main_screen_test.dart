import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import '../../main_robot.dart';

void main() {
  testWidgets('Main screen switch tab correctly', (tester) async {
    final r = MainRobot(tester);
    final songRepository = MockSongRepository();
    final albumRepository = MockAlbumRepository();

    await r.pumpMainScreen(
        songRepository: songRepository, albumRepository: albumRepository);
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

    verify(songRepository.fetchSongsHighlighted).called(1);
    verify(albumRepository.fetchNew).called(1);
    verify(albumRepository.fetchTop).called(1);
  });
}
