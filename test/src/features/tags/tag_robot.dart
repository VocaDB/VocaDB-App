import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/common_widgets/error_message_widget.dart';
import 'package:vocadb_app/src/features/albums/data/album_repository.dart';
import 'package:vocadb_app/src/features/artists/data/artist_repository.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/tags/data/tag_repository.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_detail_screen/tag_detail_button_bar.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_detail_screen/tag_detail_screen.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';
import 'package:vocadb_app/src/utils/share_launcher.dart';
import 'package:vocadb_app/src/utils/url_launcher.dart';

class TagRobot {
  final WidgetTester tester;

  TagRobot(this.tester);

  Future<void> pumpTagDetailScreen({
    required String tagId,
    TagRepository? tagRepository,
    SongRepository? songRepository,
    ArtistRepository? artistRepository,
    AlbumRepository? albumRepository,
    UrlLauncher? urlLauncher,
    ShareLauncher? shareLauncher,
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (tagRepository != null)
            tagRepositoryProvider.overrideWithValue(tagRepository),
          if (songRepository != null)
            songRepositoryProvider.overrideWithValue(songRepository),
          if (artistRepository != null)
            artistRepositoryProvider.overrideWithValue(artistRepository),
          if (albumRepository != null)
            albumRepositoryProvider.overrideWithValue(albumRepository),
          if (urlLauncher != null)
            urlLauncherProvider.overrideWithValue(urlLauncher),
          if (shareLauncher != null)
            shareLauncherProvider.overrideWithValue(shareLauncher),
        ],
        child: MaterialApp(
          home: TagDetailScreen(
            tagId: tagId,
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

  Future<void> expectAddButtonVisible() async {
    final finder = find.byKey(TagDetailButtonBar.addBtnKey);
    expect(finder, findsOneWidget);
  }

  Future<void> expectShareButtonVisible() async {
    final finder = find.byKey(TagDetailButtonBar.shareBtnKey);
    expect(finder, findsOneWidget);
  }

  Future<void> expectInfoButtonVisible() async {
    final finder = find.byKey(TagDetailButtonBar.infoBtnKey);
    expect(finder, findsOneWidget);
  }

  Future<void> tapMoreInfo() async {
    final finder = find.byKey(TagDetailButtonBar.infoBtnKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pump();
  }

  Future<void> tapShare() async {
    final finder = find.byKey(TagDetailButtonBar.shareBtnKey);
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
    final finder = find.byKey(TagDetailButtonBar.infoBtnKey);
    expect(finder, findsOneWidget);
  }
}
