import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

import 'release_event_search_controller_test.mocks.dart';

@GenerateMocks([ReleaseEventRepository, SharedPreferenceService])
void main() {
  final mockReleaseEventRepository = MockReleaseEventRepository();
  final mockSharePreference = MockSharedPreferenceService();

  final ReleaseEventSearchController controller = ReleaseEventSearchController(
      releaseEventRepository: mockReleaseEventRepository,
      sharedPreferenceService: mockSharePreference);

  setUp(() async {});

  test('should fetch api release events with all default values successfully',
      () async {
    final mockReleaseEventModel = ReleaseEventModel(id: 1, name: 'A');

    when(mockReleaseEventRepository.findReleaseEvents(
        start: 0,
        lang: 'Default',
        query: '',
        category: '',
        sort: 'Name',
        beforeDate: null,
        afterDate: null,
        artistIds: [],
        tagIds: [])).thenAnswer((_) => Future.value([mockReleaseEventModel]));

    when(mockSharePreference.getContentLang).thenReturn('Default');

    List<ReleaseEventModel> results = await controller.fetchApi();

    expect(results.length, 1);
    expect(results[0], mockReleaseEventModel);
  });

  test(
      'should fetch api release event with all non-default values successfully',
      () async {
    final mockReleaseEventModel = ReleaseEventModel(id: 1, name: 'A');

    when(mockReleaseEventRepository.findReleaseEvents(
            start: 10,
            lang: 'English',
            query: 'Miku',
            category: 'Concert',
            sort: 'AdditionDate',
            artistIds: ['1', '2'],
            tagIds: ['3', '4']))
        .thenAnswer((_) => Future.value([mockReleaseEventModel]));

    when(mockSharePreference.getContentLang).thenReturn('English');

    controller.query('Miku');
    controller.category('Concert');
    controller.sort('AdditionDate');
    controller.artists([ArtistModel(id: 1), ArtistModel(id: 2)]);
    controller.tags([TagModel(id: 3), TagModel(id: 4)]);

    List<ReleaseEventModel> results = await controller.fetchApi(start: 10);

    expect(results.length, 1);
    expect(results[0], mockReleaseEventModel);
  });
}
