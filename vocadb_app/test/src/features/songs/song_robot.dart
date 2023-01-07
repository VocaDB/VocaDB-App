import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_derived_list_view.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_related_list_view.dart';

class SongRobot {
  final WidgetTester tester;

  SongRobot(this.tester);

  Future<void> pumpSongDetailScreen(
      {SongRepository? songRepository, required String songId}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (songRepository != null)
            songRepositoryProvider.overrideWithValue(songRepository),
        ],
        child: MaterialApp(
          home: SongDetailScreen(
            songId: songId,
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
