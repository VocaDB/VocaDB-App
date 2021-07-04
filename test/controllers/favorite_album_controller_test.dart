import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

import 'favorite_album_controller_test.mocks.dart';

@GenerateMocks([UserRepository, AuthService, SharedPreferenceService])
void main() {
  final mockUserRepository = MockUserRepository();
  final mockAuthService = MockAuthService();
  final mockSharePreference = MockSharedPreferenceService();

  final FavoriteAlbumController controller = FavoriteAlbumController(
      userRepository: mockUserRepository,
      authService: mockAuthService,
      sharedPreferenceService: mockSharePreference);

  setUp(() async {
    when(mockAuthService.currentUser)
        .thenReturn(Rx<UserModel>(UserModel(id: 1)));
  });

  test('should fetch api favorite albums with all default values successfully',
      () async {
    final mockAlbumModel = AlbumUserModel(album: AlbumModel(id: 1, name: 'A'));

    when(mockUserRepository.getAlbums(1,
        start: 0,
        maxResults: 50,
        lang: 'Default',
        query: '',
        discType: '',
        purchaseStatuses: '',
        sort: 'Name',
        artistIds: [],
        tagIds: [])).thenAnswer((_) => Future.value([mockAlbumModel]));

    when(mockSharePreference.getContentLang).thenReturn('Default');

    List<AlbumUserModel> results = await controller.fetchApi();

    expect(results.length, 1);
    expect(results[0], mockAlbumModel);
  });

  test(
      'should fetch api favorite albums with all non-default values successfully',
      () async {
    final mockAlbumModel = AlbumUserModel(album: AlbumModel(id: 1, name: 'A'));

    when(mockUserRepository.getAlbums(1,
        start: 10,
        maxResults: 50,
        lang: 'English',
        query: 'Miku',
        discType: 'Original',
        purchaseStatuses: 'None',
        sort: 'AdditionDate',
        artistIds: ['1', '2'],
        tagIds: ['3', '4'])).thenAnswer((_) => Future.value([mockAlbumModel]));

    when(mockSharePreference.getContentLang).thenReturn('English');

    controller.query('Miku');
    controller.sort('AdditionDate');
    controller.purchaseStatuses('None');
    controller.discType('Original');
    controller.artists([ArtistModel(id: 1), ArtistModel(id: 2)]);
    controller.tags([TagModel(id: 3), TagModel(id: 4)]);

    List<AlbumUserModel> results = await controller.fetchApi(start: 10);

    expect(results.length, 1);
    expect(results[0], mockAlbumModel);
  });
}
