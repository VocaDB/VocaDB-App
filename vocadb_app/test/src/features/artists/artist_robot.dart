import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/artist_detail_screen.dart';

class ArtistRobot {
  final WidgetTester tester;

  ArtistRobot(this.tester);

  Future<void> pumpArtistDetailScreen() async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: ArtistDetailScreen(
            artistId: '1',
          ),
        ),
      ),
    );
    await tester.pump();
  }
}
