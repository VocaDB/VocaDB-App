import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/albums/data/constants/fake_albums_list.dart';
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

    when(() => tagRepository.fetchTagID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value(kFakeTagDetail));

    when(() => songRepository.fetchTopSongsByTagID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value(kFakeSongsList));

    when(() => artistRepository.fetchTopArtistsByTagID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value(kFakeArtistList));

    when(() => albumRepository.fetchTopAlbumsByTagID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value(kFakeAlbumsList));

    await r.pumpTagDetailScreen(
      tagId: '29',
      tagRepository: tagRepository,
      songRepository: songRepository,
      artistRepository: artistRepository,
      albumRepository: albumRepository,
    );

    await tester.pump();

    await r.expectErrorMessageWidgetNotVisible();

    // await r.expectAddButtonVisible();
    await r.expectInfoButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectTagNameIs('ballad');
    await r.expectTagCategoryIs('Genres');
    await r.expectDescriptionIsVisible(true);
    await r.expectWebLinksVisible(true);

    verify(() => tagRepository.fetchTagID(any(),
        lang: any(named: 'lang', that: isNotEmpty))).called(1);
    verify(() => songRepository.fetchTopSongsByTagID(any(),
        lang: any(named: 'lang', that: isNotEmpty))).called(1);
    verify(() => artistRepository.fetchTopArtistsByTagID(any(),
        lang: any(named: 'lang', that: isNotEmpty))).called(1);
    verify(() => albumRepository.fetchTopAlbumsByTagID(any(),
        lang: any(named: 'lang', that: isNotEmpty))).called(1);
  });

  testWidgets('tag detail screen with default values', (tester) async {
    final r = TagRobot(tester);

    final tagRepository = MockTagRepository();
    final songRepository = MockSongRepository();
    final artistRepository = MockArtistRepository();
    final albumRepository = MockAlbumRepository();

    when(() => tagRepository.fetchTagID(29, lang: 'Default')).thenAnswer(
        (_) => Future.value(Tag(id: 29, name: 'rock', categoryName: 'Genres')));

    when(() => songRepository.fetchTopSongsByTagID(any(), lang: 'Default'))
        .thenAnswer((_) => Future.value([]));

    when(() => artistRepository.fetchTopArtistsByTagID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value([]));

    when(() => albumRepository.fetchTopAlbumsByTagID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value([]));

    await r.pumpTagDetailScreen(
      tagId: '29',
      tagRepository: tagRepository,
      songRepository: songRepository,
      artistRepository: artistRepository,
      albumRepository: albumRepository,
    );

    await tester.pump();

    await r.expectErrorMessageWidgetNotVisible();

    // await r.expectAddButtonVisible();
    await r.expectInfoButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectTagNameIs('rock');
    await r.expectTagCategoryIs('Genres');
    await r.expectDescriptionIsVisible(false);

    verify(() => tagRepository.fetchTagID(29, lang: 'Default')).called(1);
    verify(() => songRepository.fetchTopSongsByTagID(any(),
        lang: any(named: 'lang', that: isNotEmpty))).called(1);
    verify(() => artistRepository.fetchTopArtistsByTagID(any(),
        lang: any(named: 'lang', that: isNotEmpty))).called(1);
    verify(() => albumRepository.fetchTopAlbumsByTagID(any(),
        lang: any(named: 'lang', that: isNotEmpty))).called(1);
    await r.expectWebLinksVisible(false);
  });
  
  testWidgets('tap more info on tag detail screen', (tester) async {
    final r = TagRobot(tester);

    final tagRepository = MockTagRepository();
    final songRepository = MockSongRepository();
    final artistRepository = MockArtistRepository();
    final albumRepository = MockAlbumRepository();
    final urlLauncher = MockUrlLauncher();

    when(() => tagRepository.fetchTagID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value(kFakeTagDetail));

    when(() => songRepository.fetchTopSongsByTagID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value(kFakeSongsList));

    when(() => artistRepository.fetchTopArtistsByTagID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value(kFakeArtistList));

    when(() => albumRepository.fetchTopAlbumsByTagID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value(kFakeAlbumsList));

    await r.pumpTagDetailScreen(
      tagId: '29',
      tagRepository: tagRepository,
      songRepository: songRepository,
      artistRepository: artistRepository,
      albumRepository: albumRepository,
      urlLauncher: urlLauncher,
    );

    await tester.pump();

    await r.expectErrorMessageWidgetNotVisible();

    // await r.expectAddButtonVisible();
    await r.expectInfoButtonVisible();
    await r.expectShareButtonVisible();

    await r.tapMoreInfo();

    verify(() => urlLauncher.launchTagMoreInfo(kFakeTagDetail.id)).called(1);
  });

  testWidgets('tap share on tag detail screen', (tester) async {
    final r = TagRobot(tester);

    final tagRepository = MockTagRepository();
    final songRepository = MockSongRepository();
    final artistRepository = MockArtistRepository();
    final albumRepository = MockAlbumRepository();
    final shareLauncher = MockShareLauncher();

    when(() => tagRepository.fetchTagID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value(kFakeTagDetail));

    when(() => songRepository.fetchTopSongsByTagID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value(kFakeSongsList));

    when(() => artistRepository.fetchTopArtistsByTagID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value(kFakeArtistList));

    when(() => albumRepository.fetchTopAlbumsByTagID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value(kFakeAlbumsList));

    await r.pumpTagDetailScreen(
      tagId: '29',
      tagRepository: tagRepository,
      songRepository: songRepository,
      artistRepository: artistRepository,
      albumRepository: albumRepository,
      shareLauncher: shareLauncher,
    );

    await tester.pump();

    await r.expectErrorMessageWidgetNotVisible();

    await r.expectInfoButtonVisible();
    await r.expectShareButtonVisible();

    await r.tapShare();

    verify(() => shareLauncher.shareTag(kFakeTagDetail.id)).called(1);
  });
}
