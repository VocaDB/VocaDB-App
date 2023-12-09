import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/pvs/presentation/playlist_screen/playlist_screen.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_songs_list.dart';

class PVRobot {
  final WidgetTester tester;

  PVRobot(this.tester);

  Future<void> pumpPlaylistScreen() async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: PlaylistScreen(
            songs: kFakeSongsList,
          ),
        ),
      ),
    );
    await tester.pump();
  }
}
