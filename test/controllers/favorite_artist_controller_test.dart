import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

import 'favorite_artist_controller_test.mocks.dart';

@GenerateMocks([UserRepository, AuthService, SharedPreferenceService])
void main() {
  final mockUserRepository = MockUserRepository();
  final mockAuthService = MockAuthService();
  final mockSharePreference = MockSharedPreferenceService();

  final FavoriteArtistController controller = FavoriteArtistController(
      userRepository: mockUserRepository,
      authService: mockAuthService,
      sharedPreferenceService: mockSharePreference);

  setUp(() async {
    when(mockAuthService.currentUser)
        .thenReturn(Rx<UserModel>(UserModel(id: 1)));
  });

  test('should fetch api favorite artists with all default values successfully',
      () async {
    final mockArtistModel =
        FollowedArtistModel(artist: ArtistModel(id: 1, name: 'A'));

    when(mockUserRepository.getFollowedArtists(1,
        query: '',
        start: 0,
        maxResults: 50,
        lang: 'Default',
        artistType: '',
        nameMatchMode: 'Auto',
        tagIds: [])).thenAnswer((_) => Future.value([mockArtistModel]));

    when(mockSharePreference.getContentLang).thenReturn('Default');

    List<FollowedArtistModel> results = await controller.fetchApi();

    expect(results.length, 1);
    expect(results[0], mockArtistModel);
  });

  test(
      'should fetch api favorite artists with all non-default values successfully',
      () async {
    final mockArtistModel =
        FollowedArtistModel(artist: ArtistModel(id: 1, name: 'A'));

    when(mockUserRepository.getFollowedArtists(1,
        query: 'Miku',
        start: 10,
        maxResults: 50,
        lang: 'English',
        artistType: 'Vocaloid',
        nameMatchMode: 'Auto',
        tagIds: ['3', '4'])).thenAnswer((_) => Future.value([mockArtistModel]));

    when(mockSharePreference.getContentLang).thenReturn('English');

    controller.query('Miku');
    controller.artistType('Vocaloid');
    controller.tags([TagModel(id: 3), TagModel(id: 4)]);

    List<FollowedArtistModel> results = await controller.fetchApi(start: 10);

    expect(results.length, 1);
    expect(results[0], mockArtistModel);
  });
}
