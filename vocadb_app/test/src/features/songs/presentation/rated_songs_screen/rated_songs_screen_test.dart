import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_rated_songs_list.dart';
import 'package:vocadb_app/src/features/users/data/request/rated_songs_list_params.dart';

import '../../../../mocks.dart';
import '../../song_robot.dart';

void main() {
  testWidgets('rated songs screen ...', (tester) async {
    // TODO: Implement test
    final r = SongRobot(tester);
    final songRepository = MockSongRepository();
    final userRepository = MockUserRepository();

    // Mock
    callFetchRatedSongsList() =>
        userRepository.fetchRatedSongsList(1, RatedSongsListParams());

    when(callFetchRatedSongsList)
        .thenAnswer((_) => Future.value(kFakeRatedSongsList));

    await r.pumpRatedSongsListScreen(songRepository: songRepository);
  });
}
