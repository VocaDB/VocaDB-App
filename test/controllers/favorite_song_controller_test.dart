import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

import 'favorite_song_controller_test.mocks.dart';

@GenerateMocks([UserRepository, AuthService, SharedPreferenceService])
void main() {
  final mockUserRepository = MockUserRepository();
  final mockAuthService = MockAuthService();
  final mockSharePreference = MockSharedPreferenceService();

  final FavoriteSongController controller = FavoriteSongController(
      userRepository: mockUserRepository,
      authService: mockAuthService,
      sharedPreferenceService: mockSharePreference);

  setUp(() async {
    when(mockAuthService.currentUser)
        .thenReturn(Rx<UserModel>(UserModel(id: 1)));
  });

  test('should fetch api favorite songs with all default values successfully',
      () async {
    final mockSongModel = RatedSongModel(song: SongModel(id: 1, name: 'A'));

    when(mockUserRepository.getRatedSongs(1,
        start: 0,
        maxResults: 50,
        lang: 'Default',
        query: '',
        rating: '',
        groupByRating: false,
        sort: 'RatingDate',
        artistIds: [],
        tagIds: [])).thenAnswer((_) => Future.value([mockSongModel]));

    when(mockSharePreference.getContentLang).thenReturn('Default');

    List<RatedSongModel> results = await controller.fetchApi();

    expect(results.length, 1);
    expect(results[0], mockSongModel);
  });

  test(
      'should fetch api favorite songs with all non-default values successfully',
      () async {
    final mockSongModel = RatedSongModel(song: SongModel(id: 1, name: 'A'));

    when(mockUserRepository.getRatedSongs(1,
        start: 10,
        maxResults: 50,
        lang: 'English',
        query: 'Miku',
        rating: '5',
        groupByRating: true,
        sort: 'AdditionDate',
        artistIds: ['1', '2'],
        tagIds: ['3', '4'])).thenAnswer((_) => Future.value([mockSongModel]));

    when(mockSharePreference.getContentLang).thenReturn('English');

    controller.query('Miku');
    controller.sort('AdditionDate');
    controller.rating('5');
    controller.groupByRating(true);
    controller.artists([ArtistModel(id: 1), ArtistModel(id: 2)]);
    controller.tags([TagModel(id: 3), TagModel(id: 4)]);

    List<RatedSongModel> results = await controller.fetchApi(start: 10);

    expect(results.length, 1);
    expect(results[0], mockSongModel);
  });
}
