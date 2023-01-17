import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/tags/data/constants/fake_tag_detail.dart';

import '../../../../mocks.dart';
import '../../tag_robot.dart';

void main() {
  testWidgets('tag detail screen ...', (tester) async {
    final r = TagRobot(tester);

    final tagRepository = MockTagRepository();
    final songRepository = MockSongRepository();
    final artistRepository = MockArtistRepository();
    final albumRepository = MockAlbumRepository();

    when(() => tagRepository.fetchTagID(1, lang: 'Default'))
        .thenAnswer((invocation) => Future.value(kFakeTagDetail));

    await r.pumpTagDetailScreen(
      tagRepository: tagRepository,
      songRepository: songRepository,
      artistRepository: artistRepository,
      albumRepository: albumRepository,
    );

    verify(() => tagRepository.fetchTagID(1, lang: 'Default')).called(1);

    await r.expectErrorMessageWidgetNotVisible();

    await r.expectAddButtonVisible();
    await r.expectInfoButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectWebLinksVisible(true);
  });
}
