import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_detail_screen/tag_detail_screen.dart';

class TagRobot {
  final WidgetTester tester;

  TagRobot(this.tester);

  Future<void> pumpTagDetailScreen() async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: TagDetailScreen(
            tagId: '1',
          ),
        ),
      ),
    );
    await tester.pump();
  }
}
