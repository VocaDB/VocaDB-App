import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/albums/data/constants/fake_albums_list.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/constants/fake_release_event_detail.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_songs_list.dart';

import '../../../../mocks.dart';
import '../../release_event_robot.dart';

void main() {
  testWidgets('release event detail screen ...', (tester) async {
    final r = ReleaseEventRobot(tester);
    final releaseEventRepository = MockReleaseEventRepository();

    when(() => releaseEventRepository.fetchReleaseEventByID(any()))
        .thenAnswer((_) => Future.value(kFakeReleaseEventDetail));

    when(() => releaseEventRepository.fetchAlbums(any()))
        .thenAnswer((_) => Future.value(kFakeAlbumsList));

    when(() => releaseEventRepository.fetchPublishedSongs(any()))
        .thenAnswer((_) => Future.value(kFakeSongsList));

    await r.pumpReleaseEventDetailScreen(
      releaseEventRepository: releaseEventRepository,
    );

    await tester.pump();

    await r.expectErrorMessageWidgetNotVisible();

    await r.expectAddButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectInfoButtonVisible();

    await r.scrollDown();

    await r.expectSongsListVisible(true);
    await r.expectAlbumsListVisible(true);
    await r.expectWebLinksVisible(true);
  });

  testWidgets('release event detail screen with default values',
      (tester) async {
    final r = ReleaseEventRobot(tester);
    final releaseEventRepository = MockReleaseEventRepository();

    when(() => releaseEventRepository.fetchReleaseEventByID(any())).thenAnswer(
        (_) => Future.value(ReleaseEvent(id: 1, name: 'Test-event')));

    when(() => releaseEventRepository.fetchAlbums(any()))
        .thenAnswer((_) => Future.value([]));

    when(() => releaseEventRepository.fetchPublishedSongs(any()))
        .thenAnswer((_) => Future.value([]));

    await r.pumpReleaseEventDetailScreen(
      releaseEventRepository: releaseEventRepository,
    );

    await tester.pump();

    await r.expectErrorMessageWidgetNotVisible();

    await r.expectAddButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectInfoButtonVisible();

    await r.expectSongsListVisible(false);
    await r.expectAlbumsListVisible(false);
    await r.expectWebLinksVisible(false);
  });

  testWidgets('tap more info on release event detail screen', (tester) async {
    final r = ReleaseEventRobot(tester);
    final releaseEventRepository = MockReleaseEventRepository();
    final urlLauncher = MockUrlLauncher();

    when(() => releaseEventRepository.fetchReleaseEventByID(any()))
        .thenAnswer((_) => Future.value(kFakeReleaseEventDetail));

    when(() => releaseEventRepository.fetchAlbums(any()))
        .thenAnswer((_) => Future.value(kFakeAlbumsList));

    when(() => releaseEventRepository.fetchPublishedSongs(any()))
        .thenAnswer((_) => Future.value(kFakeSongsList));

    await r.pumpReleaseEventDetailScreen(
      releaseEventRepository: releaseEventRepository,
      urlLauncher: urlLauncher
    );

    await tester.pump();

    await r.expectErrorMessageWidgetNotVisible();

    await r.expectAddButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectInfoButtonVisible();
    
    await r.tapMoreInfo();

    verify(() => urlLauncher.launchReleaseEventMoreInfo(kFakeReleaseEventDetail.id)).called(1);
  });

  testWidgets('tap share on release event detail screen', (tester) async {
    final r = ReleaseEventRobot(tester);
    final releaseEventRepository = MockReleaseEventRepository();
    final shareLauncher = MockShareLauncher();

    when(() => releaseEventRepository.fetchReleaseEventByID(any()))
        .thenAnswer((_) => Future.value(kFakeReleaseEventDetail));

    when(() => releaseEventRepository.fetchAlbums(any()))
        .thenAnswer((_) => Future.value(kFakeAlbumsList));

    when(() => releaseEventRepository.fetchPublishedSongs(any()))
        .thenAnswer((_) => Future.value(kFakeSongsList));

    await r.pumpReleaseEventDetailScreen(
      releaseEventRepository: releaseEventRepository,
      shareLauncher: shareLauncher
    );

    await tester.pump();

    await r.expectErrorMessageWidgetNotVisible();

    await r.expectAddButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectInfoButtonVisible();
    
    await r.tapShare();

    verify(() => shareLauncher.shareReleaseEvent(kFakeReleaseEventDetail.id)).called(1);
  });
}
