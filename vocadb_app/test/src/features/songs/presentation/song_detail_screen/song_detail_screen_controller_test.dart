import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen_controller.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_state.dart';

import '../../../../mocks.dart';

void main() {
  group('song_detail_screen_controller', () {
    late MockSongRepository songRepository;

    setUp(() {
      songRepository = MockSongRepository();
    });

    test('fetchSongID when initial success', () async {
      const initSong = Song(id: 1, name: 'Melt');
      const loadedSong = Song(id: 1, name: 'Melt', artistString: 'Miku');

      when(() => songRepository.fetchSongId(1))
          .thenAnswer((_) => Future.value(loadedSong));

      final controller = SongDetailScreenController(
        songRepository: songRepository,
        song: initSong,
      );
      expectLater(
        controller.stream,
        emitsInOrder([
          // result success state
          SongDetailState(song: const AsyncValue.data(loadedSong)),
        ]),
      );

      verify(() => songRepository.fetchSongId(1)).called(1);
    });

    test('fetchSongID failure', () async {
      const initSong = Song(id: 1, name: 'Melt');
      final exception = Exception('Connection failed');
      when(() => songRepository.fetchSongId(1)).thenThrow(exception);

      final controller = SongDetailScreenController(
        songRepository: songRepository,
        song: initSong,
      );
      expectLater(
        controller.stream,
        emitsInOrder([
          // loading state
          SongDetailState(song: const AsyncValue.loading()),

          // result error state
          predicate<SongDetailState>((state) {
            expect(state.song.hasError, true);
            return true;
          }),
        ]),
      );
      // run
      final result = await controller.loadDetail();
      // verify
      expect(result, false);
    });
  });
}
