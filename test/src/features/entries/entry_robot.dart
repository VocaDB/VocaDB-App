import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/entries/data/entry_repository.dart';
import 'package:vocadb_app/src/features/entries/presentation/entries_search_screen/entries_search_screen.dart';

class EntryRobot {
  final WidgetTester tester;

  EntryRobot(this.tester);

  Future<void> pumpEntriesSearchScreen(
      {EntryRepository? entryRepository}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (entryRepository != null)
            entryRepositoryProvider.overrideWithValue(entryRepository),
        ],
        child: const MaterialApp(
          home: EntriesSearchScreen(),
        ),
      ),
    );
    await tester.pump();
  }
}
