import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/domain/song_related.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen_controller.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_state.dart';

import '../../../../mocks.dart';

void main() {
  group('song_detail_screen_controller', () {
    late MockSongRepository songRepository;
    late MockAuthRepository authRepository;
    late SongDetailScreenController controller;

    setUp(() {
      songRepository = MockSongRepository();
      authRepository = MockAuthRepository();
      controller = SongDetailScreenController(
        songRepository: songRepository,
        authRepository: authRepository,
        song: const Song(id: 1, name: 'Melt'),
      );
    });

    test('initial with fetchSongID and fetchSongRelated success', () async {
      const song = Song(id: 1, name: 'Melt', artistString: 'Miku');
      const songRelated = SongRelated(likeMatches: [
        Song(id: 2, name: 'Song_B'),
        Song(id: 1, name: 'Song_C'),
      ]);
      const songDerived = [
        Song(id: 3, name: 'song_derived_a'),
        Song(id: 4, name: 'song_derived_b')
      ];

      when(() => songRepository.fetchSongId(1))
          .thenAnswer((_) => Future.value(song));

      when(() => songRepository.fetchSongsRelated(1))
          .thenAnswer((_) => Future.value(songRelated));

      when(() => songRepository.fetchSongsDerived(1))
          .thenAnswer((_) => Future.value(songDerived));

      expectLater(
        controller.stream,
        emitsInOrder([
          // fetchSongID loading
          const SongDetailState(
            song: AsyncValue.loading(),
          ),

          // fetchSongID success
          const SongDetailState(
            song: AsyncValue.data(song),
          ),

          // fetchSongRelated loading
          const SongDetailState(
            song: AsyncValue.data(song),
            relatedSongs: AsyncValue.loading(),
          ),

          // fetchSongRelated success
          const SongDetailState(
            song: AsyncValue.data(song),
            relatedSongs: AsyncValue.data(songRelated),
          ),

          // fetchSongDerived loading
          const SongDetailState(
            song: AsyncValue.data(song),
            relatedSongs: AsyncValue.data(songRelated),
            derivedSongs: AsyncValue.loading(),
          ),

          // fetchSongDerived success
          const SongDetailState(
            song: AsyncValue.data(song),
            relatedSongs: AsyncValue.data(songRelated),
            derivedSongs: AsyncValue.data(songDerived),
          ),
          emitsDone
        ]),
      );

      await controller.init();

      // Close controller
      controller.dispose();

      verify(() => songRepository.fetchSongId(1)).called(1);
      verify(() => songRepository.fetchSongsRelated(1)).called(1);
      verify(() => songRepository.fetchSongsDerived(1)).called(1);
    });

    test(
        'initial with fetchSongID failure should not load related songs and derived songs',
        () async {
      final exception = Exception('Connection failed');
      when(() => songRepository.fetchSongId(1)).thenThrow(exception);

      expectLater(
        controller.stream,
        emitsInOrder([
          // fetchSongID loading
          const SongDetailState(
            song: AsyncValue.loading(),
          ),

          // fetchSongID error
          predicate<SongDetailState>((state) {
            expect(state.song.hasError, true);
            return true;
          }),

          emitsDone
        ]),
      );

      await controller.init();

      // Close controller
      controller.dispose();

      verify(() => songRepository.fetchSongId(1)).called(1);
      verifyNever(() => songRepository.fetchSongsRelated(1));
      verifyNever(() => songRepository.fetchSongsDerived(1));
    });
  });
}
