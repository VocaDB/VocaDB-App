import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/albums/data/constants/fake_album_detail.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/domain/album_collection.dart';
import 'package:vocadb_app/src/features/albums/domain/album_rate.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_collection_edit_modal.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_detail_screen.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/widgets/album_basic_info.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/widgets/album_detail_button_bar.dart';
import 'package:vocadb_app/src/features/authentication/domain/app_user.dart';

import '../../../../mocks.dart';
import '../../album_robot.dart';

void main() {
  late MockAlbumRepository albumRepository;
  late MockAuthRepository authRepository;

  setUp(() {
    albumRepository = MockAlbumRepository();
    authRepository = MockAuthRepository();
  });

  testWidgets('album detail screen initial success', (tester) async {
    final r = AlbumRobot(tester);

    when(() => albumRepository.fetchAlbumID(any()))
        .thenAnswer((invocation) => Future.value(kFakeAlbumDetailSingleDisc));

    await r.pumpAlbumDetailScreen(
      albumRepository: albumRepository,
      authRepository: authRepository,
    );

    await r.expectErrorMessageWidgetNotVisible();

    expect(find.widgetWithText(AlbumBasicInfo, 'synthesis'), findsOneWidget);
    expect(find.widgetWithText(AlbumBasicInfo, 'Tripshots feat. 初音ミク'),
        findsOneWidget);
    expect(find.widgetWithText(AlbumBasicInfo, 'Album • 6/11/2009'),
        findsOneWidget);

    await r.expectAlbumDetailImageVisible();

    // Buttons
    await r.expectAddButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectInfoButtonVisible();

    // Rating info
    await r.expectTotalRatingVisible();
    await r.expectAverageRatingVisible();

    await r.expectTagsVisible(true);
    await r.expectArtistsVisible(true);

    await r.scrollDown();

    await r.expectTracksListVisible(true);
    await r.expectPVsVisible(true);

    await r.scrollDown();

    await r.expectWebLinksVisible(true);
  });

  testWidgets('album detail screen initial success with logged in user',
      (tester) async {
    final r = AlbumRobot(tester);

    when(() => albumRepository.fetchAlbumID(any()))
        .thenAnswer((invocation) => Future.value(kFakeAlbumDetailSingleDisc));

    await r.pumpAlbumDetailScreen(
      albumRepository: albumRepository,
      authRepository: authRepository,
    );

    await r.expectErrorMessageWidgetNotVisible();

    expect(find.widgetWithText(AlbumBasicInfo, 'synthesis'), findsOneWidget);
    expect(find.widgetWithText(AlbumBasicInfo, 'Tripshots feat. 初音ミク'),
        findsOneWidget);
    expect(find.widgetWithText(AlbumBasicInfo, 'Album • 6/11/2009'),
        findsOneWidget);

    await r.expectAlbumDetailImageVisible();

    // Buttons
    await r.expectAddButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectInfoButtonVisible();

    // Rating info
    await r.expectTotalRatingVisible();
    await r.expectAverageRatingVisible();

    await r.expectTagsVisible(true);
    await r.expectArtistsVisible(true);

    await r.scrollDown();

    await r.expectTracksListVisible(true);
    await r.expectPVsVisible(true);

    await r.scrollDown();

    await r.expectWebLinksVisible(true);
  });

  testWidgets('album detail screen with album detail all fields are default',
      (tester) async {
    final r = AlbumRobot(tester);

    when(() => albumRepository.fetchAlbumID(any()))
        .thenAnswer((invocation) => Future.value(Album(id: 1)));

    await r.pumpAlbumDetailScreen(
      albumRepository: albumRepository,
      authRepository: authRepository,
    );

    await r.expectErrorMessageWidgetNotVisible();

    await r.expectAlbumDetailImageVisible();

    // Buttons
    await r.expectAddButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectInfoButtonVisible();

    // Rating info
    await r.expectTotalRatingVisible();
    await r.expectAverageRatingVisible();

    await r.expectTagsVisible(false);
    await r.expectArtistsVisible(false);

    await r.scrollDown();

    await r.expectTracksListVisible(false);
    await r.expectPVsVisible(false);

    await r.scrollDown();

    await r.expectWebLinksVisible(false);
  });

  testWidgets('album detail screen with fetch album detail failure',
      (tester) async {
    final r = AlbumRobot(tester);

    when(() => albumRepository.fetchAlbumID(any())).thenThrow(
      Exception('Connection error'),
    );

    await r.pumpAlbumDetailScreen(
      albumRepository: albumRepository,
      authRepository: authRepository,
    );

    verify(() => albumRepository.fetchAlbumID(any()));
  });

  testWidgets('album detail screen with tap save album collection status',
      (tester) async {

    final r = AlbumRobot(tester);

    when(() => albumRepository.fetchAlbumID(any()))
        .thenAnswer((invocation) => Future.value(Album(id: 1)));

    when(() => albumRepository.rateAlbum(1, const AlbumRate(mediaType: 'DigitalDownload', collectionStatus: 'Owned', rating: 5)))
    .thenAnswer((invocation) => Future.value(Album(id: 1)));

    when(() => authRepository.currentUser)
        .thenReturn(const AppUser(id: 1, name: 'test'));

    when(() => authRepository.getAlbumCollection(1))
    .thenAnswer((invocation) => Future.value(const AlbumCollection(mediaType: 'DigitalDownload', purchaseStatus: 'Owned' ,rating: 5)));

    await r.pumpAlbumDetailScreen(
      albumRepository: albumRepository,
      authRepository: authRepository,
    );

    await r.expectErrorMessageWidgetNotVisible();

    await r.expectAlbumDetailImageVisible();

    expect(find.byKey(AlbumCollectionEditModal.albumCollectionStatusModal), findsNothing);
    await tester.tap(find.byKey(AlbumDetailButtonBar.addBtnKey));

    // If not using 2 pump, it will error Offset is out of bounds
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));
    expect(find.byKey(AlbumCollectionEditModal.albumCollectionStatusModal), findsOneWidget);

    expect(find.byKey(AlbumCollectionEditModal.saveBtnKey), findsOneWidget);
    await tester.ensureVisible(find.byKey(AlbumCollectionEditModal.saveBtnKey));
    await tester.tap(find.byKey(AlbumCollectionEditModal.saveBtnKey));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));
    expect(find.byKey(AlbumCollectionEditModal.albumCollectionStatusModal), findsNothing);

  });

  testWidgets('tap more info on album detail screen', (tester) async {
    final r = AlbumRobot(tester);
    final urlLauncher = MockUrlLauncher();

    when(() => albumRepository.fetchAlbumID(any()))
        .thenAnswer((invocation) => Future.value(kFakeAlbumDetailSingleDisc));

    await r.pumpAlbumDetailScreen(
      albumRepository: albumRepository,
      authRepository: authRepository,
      urlLauncher: urlLauncher
    );

    await r.expectErrorMessageWidgetNotVisible();

    expect(find.widgetWithText(AlbumBasicInfo, 'synthesis'), findsOneWidget);
    expect(find.widgetWithText(AlbumBasicInfo, 'Tripshots feat. 初音ミク'),
        findsOneWidget);
    expect(find.widgetWithText(AlbumBasicInfo, 'Album • 6/11/2009'),
        findsOneWidget);

    await r.expectAlbumDetailImageVisible();

    // Buttons
    await r.expectAddButtonVisible();
    await r.expectShareButtonVisible();
    await r.expectInfoButtonVisible();
    
    await r.tapMoreInfo();

    verify(() => urlLauncher.launchAlbumMoreInfo(kFakeAlbumDetailSingleDisc.id)).called(1);
  });

}
