import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/common_widgets/error_message_widget.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/album_list_view.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_role_list.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_repository.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_detail_screen/release_event_detail_button_bar.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_detail_screen/release_event_detail_screen.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_usage_group_view.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';
import 'package:vocadb_app/src/utils/url_launcher.dart';

class ReleaseEventRobot {
  final WidgetTester tester;

  ReleaseEventRobot(this.tester);

  Future<void> pumpReleaseEventDetailScreen({
    ReleaseEventRepository? releaseEventRepository,
    UrlLauncher? urlLauncher
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (releaseEventRepository != null)
            releaseEventRepositoryProvider
                .overrideWithValue(releaseEventRepository),
          if (urlLauncher != null)
            urlLauncherProvider
                .overrideWithValue(urlLauncher)
        ],
        child: const MaterialApp(
          home: ReleaseEventDetailScreen(
            releaseEventId: '1',
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

  Future<void> scrollDown({double offset = -800}) async {
    await tester.drag(find.byType(CustomScrollView), Offset(0, offset));
    await tester.pump();
  }

  Future<void> expectWebLinksVisible(bool visible) async {
    final finder = find.byType(WebLinkGroupList);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectSongsListVisible(bool visible) async {
    final finder = find.byType(SongListView);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectAlbumsListVisible(bool visible) async {
    final finder = find.byType(AlbumListView);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectArtistsListVisible(bool visible) async {
    final finder = find.byType(ArtistGroupByRoleList);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectTagsGroupVisible(bool visible) async {
    final finder = find.byType(TagUsageGroupView);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectAddButtonVisible() async {
    final finder = find.byKey(ReleaseEventDetailButtonBar.addBtnKey);
    expect(finder, findsOneWidget);
  }

  Future<void> expectShareButtonVisible() async {
    final finder = find.byKey(ReleaseEventDetailButtonBar.shareBtnKey);
    expect(finder, findsOneWidget);
  }

  Future<void> expectInfoButtonVisible() async {
    final finder = find.byKey(ReleaseEventDetailButtonBar.infoBtnKey);
    expect(finder, findsOneWidget);
  }

  Future<void> tapMoreInfo() async {
    final finder = find.byKey(ReleaseEventDetailButtonBar.infoBtnKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pump();
  }

  Future<void> expectTagNameIs(String name) async {
    final finder = find.widgetWithText(ListTile, name);
    expect(finder, findsOneWidget);
  }

  Future<void> expectTagCategoryIs(String category) async {
    final finder = find.widgetWithText(ListTile, category);
    expect(finder, findsOneWidget);
  }

  Future<void> expectDescriptionIsVisible(bool visible) async {
    final finder = find.byKey(ReleaseEventDetailButtonBar.infoBtnKey);
    expect(finder, findsOneWidget);
  }
}
