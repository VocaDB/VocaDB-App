import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/authentication/domain/app_user.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_rated_songs_list.dart';
import 'package:vocadb_app/src/features/users/domain/rated_songs_list_params.dart';

import '../../../../mocks.dart';
import '../../../songs/song_robot.dart';

void main() {
  testWidgets('rated songs screen with select filter success', (tester) async {
    registerFallbackValue(RatedSongsListParamsFake());
    // Setup
    final r = SongRobot(tester);
    final songRepository = MockSongRepository();
    final userRepository = MockUserRepository();
    final authRepository = MockAuthRepository();

    // Mock
    callFetchRatedSongsList() =>
        userRepository.fetchRatedSongsList(any(), any());

    when(callFetchRatedSongsList)
        .thenAnswer((_) => Future.value(kFakeRatedSongsList));

    when(() => authRepository.currentUser)
        .thenReturn(const AppUser(id: '1', name: 'up2up'));

    await r.pumpRatedSongsListScreen(
      songRepository: songRepository,
      userRepository: userRepository,
      authRepository: authRepository,
    );

    await r.expectRatedSongDisplayCountAtLeast(3);
    await r.tapIconFilterRatedSongs();

    // Filter screen
    await r.selectRating('Favorite');
    await r.selectSort('Publish date');

    await r.tapCloseFilterScreen();

    // Verify after close filter screen captured
    expect(
        verify(() => userRepository.fetchRatedSongsList(any(), captureAny()))
            .captured,
        [
          const RatedSongsListParams(),
          const RatedSongsListParams(rating: 'Favorite'),
          const RatedSongsListParams(rating: 'Favorite', sort: 'PublishDate'),
        ]);
  });
}
