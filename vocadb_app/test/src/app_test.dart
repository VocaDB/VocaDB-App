import 'package:flutter_test/flutter_test.dart';

import 'mocks.dart';
import 'robot.dart';

void main() {
  testWidgets('app ...', (tester) async {
    final r = Robot(tester);
    final songRepository = MockSongRepository();
    final artistRepository = MockArtistRepository();
    final albumRepository = MockAlbumRepository();
    final releaseEventRepository = MockReleaseEventRepository();

    await r.pumpMyApp(
      songRepository: songRepository,
      artistRepository: artistRepository,
      albumRepository: albumRepository,
      releaseEventRepository: releaseEventRepository,
    );
  });
}
