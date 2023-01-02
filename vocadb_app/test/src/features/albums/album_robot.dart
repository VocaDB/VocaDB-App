import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_detail_screen.dart';

class AlbumRobot {
  final WidgetTester tester;

  AlbumRobot(this.tester);

  Future<void> pumpAlbumDetailScreen() async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: AlbumDetailScreen(
            albumId: '1',
          ),
        ),
      ),
    );
    await tester.pump();
  }
}
