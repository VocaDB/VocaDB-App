import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

import 'album_search_controller_test.mocks.dart';

@GenerateMocks([AlbumRepository, SharedPreferenceService])
void main() {
  final mockAlbumRepository = MockAlbumRepository();
  final mockSharePreference = MockSharedPreferenceService();

  final AlbumSearchController controller = AlbumSearchController(
      albumRepository: mockAlbumRepository,
      sharedPreferenceService: mockSharePreference);

  setUp(() async {});

  test('should fetch api albums with all default values successfully',
      () async {
    final mockAlbumModel = AlbumModel(id: 1, name: 'A');

    when(mockAlbumRepository.findAlbums(
        start: 0,
        lang: 'Default',
        query: '',
        discType: '',
        sort: 'Name',
        artistIds: [],
        tagIds: [])).thenAnswer((_) => Future.value([mockAlbumModel]));

    when(mockSharePreference.getContentLang).thenReturn('Default');

    List<AlbumModel> results = await controller.fetchApi();

    expect(results.length, 1);
    expect(results[0], mockAlbumModel);
  });

  test('should fetch api albums with all non-default values successfully',
      () async {
    final mockAlbumModel = AlbumModel(id: 1, name: 'A');

    when(mockAlbumRepository.findAlbums(
        start: 10,
        lang: 'English',
        query: 'Miku',
        discType: 'Original',
        sort: 'AdditionDate',
        artistIds: ['1', '2'],
        tagIds: ['3', '4'])).thenAnswer((_) => Future.value([mockAlbumModel]));

    when(mockSharePreference.getContentLang).thenReturn('English');

    controller.query('Miku');
    controller.discType('Original');
    controller.sort('AdditionDate');
    controller.artists([ArtistModel(id: 1), ArtistModel(id: 2)]);
    controller.tags([TagModel(id: 3), TagModel(id: 4)]);

    List<AlbumModel> results = await controller.fetchApi(start: 10);

    expect(results.length, 1);
    expect(results[0], mockAlbumModel);
  });
}
