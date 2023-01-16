import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/common_widgets/error_message_widget.dart';
import 'package:vocadb_app/src/features/artists/data/artist_repository.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/artist_detail_screen.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/widgets/artist_detail_button_bar.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/widgets/artist_detail_image.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/widgets/artist_relations_view.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_usage_group_view.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';

class ArtistRobot {
  final WidgetTester tester;

  ArtistRobot(this.tester);

  Future<void> pumpArtistDetailScreen(
      {ArtistRepository? artistRepository}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (artistRepository != null)
            artistRepositoryProvider.overrideWithValue(artistRepository)
        ],
        child: const MaterialApp(
          home: ArtistDetailScreen(
            artistId: '1',
          ),
        ),
      ),
    );
    await tester.pump();
  }

  Future<void> expectErrorMessageWidgetNotVisible() async {
    final finder = find.byType(ErrorMessageWidget);
    expect(finder, findsNothing);
  }

  Future<void> expectLoadingNotVisible() async {
    final finder = find.byType(CircularProgressIndicator);
    expect(finder, findsNothing);
  }

  Future<void> expectArtistDetailImageVisible() async {
    final finder = find.byType(ArtistDetailImage);
    expect(finder, findsOneWidget);
  }

  Future<void> expectTagsVisible(bool visible) async {
    final finder = find.byType(TagUsageGroupView);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectLatestSongsListVisible(bool visible) async {
    final finder = find.byKey(ArtistRelationsView.latestSongsSectionKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectPopularSongsListVisible(bool visible) async {
    final finder = find.byKey(ArtistRelationsView.popularSongsSectionKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectLatestAlbumsListVisible(bool visible) async {
    final finder = find.byKey(ArtistRelationsView.latestAlbumsSectionKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectPopularAlbumsListVisible(bool visible) async {
    final finder = find.byKey(ArtistRelationsView.popularAlbumsSectionKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> scrollDown({double offset = -800}) async {
    await tester.drag(find.byType(CustomScrollView), Offset(0, offset));
    await tester.pump();
  }

  Future<void> expectWebLinksVisible(bool visible) async {
    final finder = find.byType(WebLinkGroupList);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectAddButtonVisible() async {
    final finder = find.byKey(ArtistDetailButtonBar.addBtnKey);
    expect(finder, findsOneWidget);
  }

  Future<void> expectShareButtonVisible() async {
    final finder = find.byKey(ArtistDetailButtonBar.shareBtnKey);
    expect(finder, findsOneWidget);
  }

  Future<void> expectInfoButtonVisible() async {
    final finder = find.byKey(ArtistDetailButtonBar.infoBtnKey);
    expect(finder, findsOneWidget);
  }
}
