import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

import 'song_search_controller_test.mocks.dart';

@GenerateMocks([SongRepository, SharedPreferenceService])
void main() {
  final mockSongRepository = MockSongRepository();
  final mockSharePreference = MockSharedPreferenceService();

  final SongSearchController controller = SongSearchController(
      songRepository: mockSongRepository,
      sharedPreferenceService: mockSharePreference);

  setUp(() async {});

  test('should fetch api with all default values successfully', () async {
    final mockSongModel = SongModel(id: 1, name: 'A');

    when(mockSongRepository.findSongs(
        start: 0,
        lang: 'Default',
        query: '',
        songType: '',
        sort: 'Name',
        artistIds: [],
        tagIds: [])).thenAnswer((_) => Future.value([mockSongModel]));

    when(mockSharePreference.getContentLang).thenReturn('Default');

    List<SongModel> songs = await controller.fetchApi();

    expect(songs.length, 1);
    expect(songs[0], mockSongModel);
  });

  test('should fetch api with all non-default values successfully', () async {
    final mockSongModel = SongModel(id: 1, name: 'A');

    when(mockSongRepository.findSongs(
        start: 10,
        lang: 'English',
        query: 'Miku',
        songType: 'Remaster',
        sort: 'AdditionDate',
        artistIds: ['1', '2'],
        tagIds: ['3', '4'])).thenAnswer((_) => Future.value([mockSongModel]));

    when(mockSharePreference.getContentLang).thenReturn('English');

    controller.query('Miku');
    controller.songType('Remaster');
    controller.sort('AdditionDate');
    controller.artists([ArtistModel(id: 1), ArtistModel(id: 2)]);
    controller.tags([TagModel(id: 3), TagModel(id: 4)]);

    List<SongModel> songs = await controller.fetchApi(start: 10);

    expect(songs.length, 1);
    expect(songs[0], mockSongModel);
  });
}
