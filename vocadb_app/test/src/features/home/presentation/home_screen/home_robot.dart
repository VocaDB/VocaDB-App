import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/home/presentation/home_screen/home_screen.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeRobot {
  final WidgetTester tester;

  HomeRobot(this.tester);

  Future<void> pumpHomeScreen({SongRepository? songRepository}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (songRepository != null)
            songRepositoryProvider.overrideWithValue(songRepository)
        ],
        child: const MaterialApp(
          home: HomeScreen(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
    await tester.pump();
  }
}
