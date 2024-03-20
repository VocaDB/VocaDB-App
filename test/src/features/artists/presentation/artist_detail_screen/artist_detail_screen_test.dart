import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/artists/data/constants/fake_artist_detail.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';

import '../../../../mocks.dart';
import '../../artist_robot.dart';

void main() {
  testWidgets('artist detail screen initial success', (tester) async {
    final r = ArtistRobot(tester);
    final artistRepository = MockArtistRepository();

    when(() => artistRepository.fetchArtistID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value(kFakeArtistDetail));

    await r.pumpArtistDetailScreen(artistRepository: artistRepository);

    await tester.pump();

    verify(() => artistRepository.fetchArtistID(any(),
        lang: any(named: 'lang', that: isNotEmpty))).called(1);

    await r.expectArtistDetailImageVisible();
    expect(find.text('Hatsune Miku').first, findsOneWidget);

    await r.expectAddButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectInfoButtonVisible();

    await r.expectTagsVisible(true);
    await r.expectLatestSongsListVisible(true);
    await r.expectPopularSongsListVisible(true);
    await r.expectLatestAlbumsListVisible(true);
    await r.expectPopularAlbumsListVisible(true);

    await r.scrollDown();
    await r.scrollDown();
    await r.scrollDown();

    await r.expectWebLinksVisible(true);
  });

  testWidgets('artist detail screen with all fields are default',
      (tester) async {
    final r = ArtistRobot(tester);
    final artistRepository = MockArtistRepository();

    when(() => artistRepository.fetchArtistID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value(Artist(id: 1, name: 'Hatsune Miku')));

    await r.pumpArtistDetailScreen(artistRepository: artistRepository);

    await tester.pump();

    verify(() => artistRepository.fetchArtistID(any(),
        lang: any(named: 'lang', that: isNotEmpty))).called(1);

    await r.expectArtistDetailImageVisible();
    expect(find.text('Hatsune Miku').first, findsOneWidget);

    await r.expectAddButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectInfoButtonVisible();

    await r.expectTagsVisible(false);
    await r.expectLatestSongsListVisible(false);
    await r.expectPopularSongsListVisible(false);
    await r.expectLatestAlbumsListVisible(false);
    await r.expectPopularAlbumsListVisible(false);

    await r.scrollDown();
    await r.scrollDown();
    await r.scrollDown();

    await r.expectWebLinksVisible(false);
  });

  testWidgets('artist detail screen with all fields are default',
      (tester) async {
    final r = ArtistRobot(tester);
    final artistRepository = MockArtistRepository();

    when(() => artistRepository.fetchArtistID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenThrow(Exception('Connection error'));

    await r.pumpArtistDetailScreen(artistRepository: artistRepository);

    await tester.pump();

    verify(() => artistRepository.fetchArtistID(any(),
        lang: any(named: 'lang', that: isNotEmpty))).called(1);
  });

  testWidgets('tap more info on artist detail screen', (tester) async {
    final r = ArtistRobot(tester);
    final artistRepository = MockArtistRepository();
    final urlLauncher = MockUrlLauncher();

    when(() => artistRepository.fetchArtistID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value(kFakeArtistDetail));

    await r.pumpArtistDetailScreen(
      artistRepository: artistRepository, 
      urlLauncher: urlLauncher);

    await tester.pump();

    verify(() => artistRepository.fetchArtistID(any(),
        lang: any(named: 'lang', that: isNotEmpty))).called(1);

    await r.expectArtistDetailImageVisible();
    expect(find.text('Hatsune Miku').first, findsOneWidget);

    await r.expectAddButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectInfoButtonVisible();

    await r.tapMoreInfo();

    verify(() => urlLauncher.launchArtistMoreInfo(kFakeArtistDetail.id)).called(1);
  });

  testWidgets('tap share on artist detail screen', (tester) async {
    final r = ArtistRobot(tester);
    final artistRepository = MockArtistRepository();
    final shareLauncher = MockShareLauncher();

    when(() => artistRepository.fetchArtistID(any(),
            lang: any(named: 'lang', that: isNotEmpty)))
        .thenAnswer((_) => Future.value(kFakeArtistDetail));

    await r.pumpArtistDetailScreen(
      artistRepository: artistRepository, 
      shareLauncher: shareLauncher,
      );

    await tester.pump();

    verify(() => artistRepository.fetchArtistID(any(),
        lang: any(named: 'lang', that: isNotEmpty))).called(1);

    await r.expectArtistDetailImageVisible();
    expect(find.text('Hatsune Miku').first, findsOneWidget);

    await r.expectAddButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectInfoButtonVisible();

    await r.tapShare();

    verify(() => shareLauncher.shareArtist(kFakeArtistDetail.id)).called(1);
  });

}
