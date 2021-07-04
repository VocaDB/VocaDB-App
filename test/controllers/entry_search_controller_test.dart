import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

import 'entry_search_controller_test.mocks.dart';

@GenerateMocks([EntryRepository, SharedPreferenceService])
void main() {
  final mockEntryRepository = MockEntryRepository();
  final mockSharePreference = MockSharedPreferenceService();

  final EntrySearchController controller = EntrySearchController(
      entryRepository: mockEntryRepository,
      sharedPreferenceService: mockSharePreference);

  setUp(() async {});

  test('should fetch api entries with all default values successfully',
      () async {
    final mockEntryModel = EntryModel(id: 1, name: 'A');

    when(mockEntryRepository.findEntries(
        lang: 'Default',
        query: '',
        entryType: '',
        sort: 'Name',
        nameMatchMode: 'Auto',
        tagIds: [])).thenAnswer((_) => Future.value([mockEntryModel]));

    when(mockSharePreference.getContentLang).thenReturn('Default');

    List<EntryModel> results = await controller.fetchApi();

    expect(results.length, 1);
    expect(results[0], mockEntryModel);
  });

  test('should fetch api entries with all non-default values successfully',
      () async {
    final mockEntryModel = EntryModel(id: 1, name: 'A');

    when(mockEntryRepository.findEntries(
        lang: 'English',
        query: 'Miku',
        entryType: 'Song',
        sort: 'AdditionDate',
        tagIds: ['3', '4'])).thenAnswer((_) => Future.value([mockEntryModel]));

    when(mockSharePreference.getContentLang).thenReturn('English');

    controller.query('Miku');
    controller.sort('AdditionDate');
    controller.entryType('Song');
    controller.tags([TagModel(id: 3), TagModel(id: 4)]);

    List<EntryModel> results = await controller.fetchApi(start: 10);

    expect(results.length, 1);
    expect(results[0], mockEntryModel);
  });
}
