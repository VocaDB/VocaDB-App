import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';
import 'robot.dart';

void main() {
  testWidgets('app ...', (tester) async {
    final r = Robot(tester);
    final songRepository = MockSongRepository();
    final artistRepository = MockArtistRepository();
    final albumRepository = MockAlbumRepository();
    final releaseEventRepository = MockReleaseEventRepository();
    final authRepository = MockAuthRepository();

    when(() => authRepository.authStateChanges())
        .thenAnswer((invocation) => Stream.value(null));

    await r.pumpMyApp(
      songRepository: songRepository,
      artistRepository: artistRepository,
      albumRepository: albumRepository,
      releaseEventRepository: releaseEventRepository,
      authRepository: authRepository,
    );
  });
}
