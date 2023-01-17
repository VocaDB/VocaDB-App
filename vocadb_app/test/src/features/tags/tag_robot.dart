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

class TagRobot {
  final WidgetTester tester;

  TagRobot(this.tester);

  Future<void> pumpTagDetailScreen({
    TagRepository? tagRepository,
    SongRepository? songRepository,
    ArtistRepository? artistRepository,
    AlbumRepository? albumRepository,
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
        ],
        child: const MaterialApp(
          home: TagDetailScreen(
            tagId: '1',
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
}
