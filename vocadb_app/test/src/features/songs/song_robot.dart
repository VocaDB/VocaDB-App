import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/rated_songs_screen/rated_songs_screen.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_content.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/widgets.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_derived_list_view.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_related_list_view.dart';
import 'package:vocadb_app/src/features/users/data/user_repository.dart';

class SongRobot {
  final WidgetTester tester;

  SongRobot(this.tester);

  Future<void> pumpSongDetailScreen(
      {SongRepository? songRepository, required int songId}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (songRepository != null)
            songRepositoryProvider.overrideWithValue(songRepository),
        ],
        child: MaterialApp(
          home: SongDetailScreen(
            song: Song(id: songId),
          ),
        ),
      ),
    );
    // await tester.pumpAndSettle(const Duration(seconds: 10));
    await tester.pump();
  }

  Future<void> pumpSongDerivedListView(
      {SongRepository? songRepository, required int songId}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (songRepository != null)
            songRepositoryProvider.overrideWithValue(songRepository),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                SongsDerivedListView(songId: songId),
              ],
            ),
          ),
        ),
      ),
    );
    // await tester.pumpAndSettle(const Duration(seconds: 10));
  }

  Future<void> pumpRatedSongsListScreen(
      {SongRepository? songRepository, UserRepository? userRepository}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (songRepository != null)
            songRepositoryProvider.overrideWithValue(songRepository),
          if (userRepository != null)
            userRepositoryProvider.overrideWithValue(userRepository),
        ],
        child: const MaterialApp(
          home: RatedSongsScreen(),
        ),
      ),
    );
    // await tester.pumpAndSettle(const Duration(seconds: 10));
    await tester.pump();
  }

  Future<void> pumpSongRelatedListView(
      {SongRepository? songRepository, required int songId}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (songRepository != null)
            songRepositoryProvider.overrideWithValue(songRepository),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                SongsRelatedListView(songId: songId),
              ],
            ),
          ),
        ),
      ),
    );
    // await tester.pumpAndSettle(const Duration(seconds: 10));
  }

  Future<void> expectSongInfoContentVisible(bool visible) async {
    final finder = find.byType(SongDetailContent);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectSongLyricContentVisible(bool visible) async {
    final finder = find.byType(LyricContent);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectLyricButtonVisible(bool visible) async {
    final finder = find.byKey(SongDetailButtonBar.lyricBtnKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> tapLyricButton() async {
    final finder = find.byKey(SongDetailButtonBar.lyricBtnKey);
    expect(finder, findsOneWidget);

    await tester.tap(finder);
    await tester.pump();
  }

  Future<void> tapCloseLyricButton() async {
    final finder = find.byKey(LyricContent.iconCloseKey);
    expect(finder, findsOneWidget);

    await tester.tap(finder);
    await tester.pump();
  }

  Future<void> expectTagsVisible(bool visible) async {
    final finder = find.byKey(SongDetailScreen.tagsKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectArtistsVisible(bool visible) async {
    final finder = find.byKey(SongDetailScreen.artistsKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectPVsVisible(bool visible) async {
    final finder = find.byKey(SongDetailScreen.pvsKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> scrollDown({double offset = -800}) async {
    await tester.drag(find.byType(ListView).first, Offset(0, offset));
    await tester.pump();
  }

  Future<void> expectAlbumsVisible(bool visible) async {
    final finder = find.byKey(SongDetailScreen.albumsKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectAltSongsVisible(bool visible) async {
    final finder = find.byKey(SongsDerivedListView.altSongsKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectReleaseEventsVisible(bool visible) async {
    final finder = find.byKey(SongDetailScreen.releaseEventsKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectSameLikeSongsVisible(bool visible) async {
    final finder = find.byKey(SongsRelatedListView.sameLikedSongsKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }

  Future<void> expectWebLinksVisible(bool visible) async {
    final finder = find.byKey(SongDetailScreen.webLinksKey);
    (visible) ? expect(finder, findsOneWidget) : expect(finder, findsNothing);
  }
}
