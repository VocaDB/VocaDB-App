import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_detail_screen.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/widgets/widgets.dart';
import 'package:vocadb_app/src/features/albums/presentation/tracks_list/tracks_list_view.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_roles_horizontal_list_view.dart';
import 'package:vocadb_app/src/features/pvs/presentation/pv_list/pv_group_list.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_usage_group_view.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';

class AlbumRobot {
  final WidgetTester tester;

  AlbumRobot(this.tester);

  Future<void> pumpAlbumDetailScreen() async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: AlbumDetailScreen(
            album: Album(id: 1, name: 'test-album'),
          ),
        ),
      ),
    );
    await tester.pump();
  }

  Future<void> expectAlbumDetailImageVisible() async {
    final finder = find.byType(AlbumDetailImage);
    expect(finder, findsOneWidget);
  }

  Future<void> expectTagsVisible(bool visible) async {
    final finder = find.byType(TagUsageGroupView);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectArtistsVisible(bool visible) async {
    final finder = find.byType(ArtistRolesHorizontalListView);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectPVsVisible(bool visible) async {
    final finder = find.byType(PVGroupList);
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

  Future<void> expectTracksListVisible(bool visible) async {
    final finder = find.byType(TracksListView);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectTotalRatingVisible() async {
    final finder = find.byKey(AlbumRatingInfo.totalRatingKey);
    expect(finder, findsOneWidget);
  }

  Future<void> expectAverageRatingVisible() async {
    final finder = find.byKey(AlbumRatingInfo.avgRatingKey);
    expect(finder, findsOneWidget);
  }

  Future<void> expectAddButtonVisible() async {
    final finder = find.byKey(AlbumDetailButtonBar.addBtnKey);
    expect(finder, findsOneWidget);
  }

  Future<void> expectShareButtonVisible() async {
    final finder = find.byKey(AlbumDetailButtonBar.shareBtnKey);
    expect(finder, findsOneWidget);
  }

  Future<void> expectInfoButtonVisible() async {
    final finder = find.byKey(AlbumDetailButtonBar.infoBtnKey);
    expect(finder, findsOneWidget);
  }
}
