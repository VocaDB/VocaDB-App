import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/artists/data/artist_repository.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_tile/artist_tile.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list_screen/artists_list_screen.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';

class ArtistsListScreenRobot {
  final WidgetTester tester;

  ArtistsListScreenRobot(this.tester);

  Future<void> pumpArtistsListScreen(
      {ArtistRepository? artistRepository}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (artistRepository != null)
            artistRepositoryProvider.overrideWithValue(artistRepository),
          userSettingsRepositoryProvider
              .overrideWithValue(UserSettingsRepository())
        ],
        child: const MaterialApp(
          home: ArtistsListScreen(),
        ),
      ),
    );

    await tester.pump();
    await tester.pump();
    await tester.pump();
  }

  Future<void> expectArtistsDisplayCountAtLeast(int count) async {
    final finder = find.byType(ArtistTile);
    expect(finder, findsAtLeastNWidgets(count));
  }
}
