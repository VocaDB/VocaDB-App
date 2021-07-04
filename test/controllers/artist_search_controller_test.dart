import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

import 'artist_search_controller_test.mocks.dart';

@GenerateMocks([ArtistRepository, SharedPreferenceService])
void main() {
  final mockArtistRepository = MockArtistRepository();
  final mockSharePreference = MockSharedPreferenceService();

  final ArtistSearchController controller = ArtistSearchController(
      artistRepository: mockArtistRepository,
      sharedPreferenceService: mockSharePreference);

  setUp(() async {});

  test('should fetch api artists  with all default values successfully',
      () async {
    final mockArtistModel = ArtistModel(id: 1, name: 'A');

    when(mockArtistRepository.findArtists(
        start: 0,
        lang: 'Default',
        query: '',
        artistType: '',
        sort: 'Name',
        tagIds: [])).thenAnswer((_) => Future.value([mockArtistModel]));

    when(mockSharePreference.getContentLang).thenReturn('Default');

    List<ArtistModel> results = await controller.fetchApi();

    expect(results.length, 1);
    expect(results[0], mockArtistModel);
  });

  test('should fetch api artists with all non-default values successfully',
      () async {
    final mockArtistModel = ArtistModel(id: 1, name: 'A');

    when(mockArtistRepository.findArtists(
        start: 10,
        lang: 'English',
        query: 'Miku',
        artistType: 'Original',
        sort: 'AdditionDate',
        tagIds: ['3', '4'])).thenAnswer((_) => Future.value([mockArtistModel]));

    when(mockSharePreference.getContentLang).thenReturn('English');

    controller.query('Miku');
    controller.artistType('Original');
    controller.sort('AdditionDate');
    controller.tags([TagModel(id: 3), TagModel(id: 4)]);

    List<ArtistModel> results = await controller.fetchApi(start: 10);

    expect(results.length, 1);
    expect(results[0], mockArtistModel);
  });
}
