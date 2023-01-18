import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/artists/data/constants/fake_artists_list.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_songs_list.dart';
import 'package:vocadb_app/src/features/tags/data/constants/fake_tag_detail.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';

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
        .thenAnswer((_) => Future.value(kFakeTagDetail));

    when(() => songRepository.fetchTopSongsByTagID(1, lang: 'Default'))
        .thenAnswer((_) => Future.value(kFakeSongsList));

    when(() => artistRepository.fetchTopArtistsByTagID(1, lang: 'Default'))
        .thenAnswer((_) => Future.value(kFakeArtistList));

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
    await r.expectTagNameIs('ballad');
    await r.expectTagCategoryIs('Genres');
    await r.expectDescriptionIsVisible(true);
    await r.expectWebLinksVisible(true);
  });

  testWidgets('tag detail screen with default values', (tester) async {
    final r = TagRobot(tester);

    final tagRepository = MockTagRepository();
    final songRepository = MockSongRepository();
    final artistRepository = MockArtistRepository();
    final albumRepository = MockAlbumRepository();

    when(() => tagRepository.fetchTagID(1, lang: 'Default')).thenAnswer(
        (_) => Future.value(Tag(id: 1, name: 'rock', categoryName: 'Genres')));

    when(() => songRepository.fetchTopSongsByTagID(1, lang: 'Default'))
        .thenAnswer((_) => Future.value([]));

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
    await r.expectTagNameIs('rock');
    await r.expectTagCategoryIs('Genres');
    await r.expectDescriptionIsVisible(false);
    await r.expectWebLinksVisible(false);
  });
}
