import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_detail_screen/release_event_detail_screen.dart';

class ReleaseEventRobot {
  final WidgetTester tester;

  ReleaseEventRobot(this.tester);

  Future<void> pumpReleaseEventDetailScreen() async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: ReleaseEventDetailScreen(
            releaseEventId: '1',
          ),
        ),
      ),
    );
    await tester.pump();
  }
}
