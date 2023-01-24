import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/entries/data/constants/fake_entry_list.dart';
import 'package:vocadb_app/src/features/entries/domain/entries_list_params.dart';

import '../../../../mocks.dart';
import '../../entry_robot.dart';

void main() {
  testWidgets('entries search screen ...', (tester) async {
    final r = EntryRobot(tester);
    final entryRepository = MockEntryRepository();

    when(() =>
            entryRepository.fetchEntriesList(params: const EntriesListParams()))
        .thenAnswer((_) => Future.value(kFakeEntryList));

    await r.pumpEntriesSearchScreen(entryRepository: entryRepository);

    verify(() =>
            entryRepository.fetchEntriesList(params: const EntriesListParams()))
        .called(1);
  });
}
