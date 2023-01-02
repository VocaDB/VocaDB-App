import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen.dart';

class SongRobot {
  final WidgetTester tester;

  SongRobot(this.tester);

  Future<void> pumpSongDetailScreen() async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: SongDetailScreen(
            songId: '1',
          ),
        ),
      ),
    );
    await tester.pump();
  }
}
