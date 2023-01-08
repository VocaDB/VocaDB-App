@Timeout(Duration(milliseconds: 2000))
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_song_detail.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/domain/song_related.dart';

import '../../../../mocks.dart';
import '../../song_robot.dart';

void main() {
  testWidgets('song detail screen with fetch song detail success',
      (tester) async {
    /// Setup
    final r = SongRobot(tester);
    final songRepository = MockSongRepository();
    final song = kFakeSongDetail;
    when(() => songRepository.fetchSongId(song.id, lang: 'Default'))
        .thenAnswer((_) => Future.value(song));

    when(() => songRepository.fetchSongsDerived(song.id))
        .thenAnswer((_) => Future.value([
              const Song(id: 1, name: 'Song_A'),
              const Song(id: 2, name: 'Song_B'),
            ]));

    when(() => songRepository.fetchSongsRelated(song.id)).thenAnswer(
      (_) => Future.value(
        const SongRelated(likeMatches: [
          Song(id: 3, name: 'Song_Related_A'),
          Song(id: 4, name: 'Song_Related_B'),
        ]),
      ),
    );

    /// Pump screen
    await r.pumpSongDetailScreen(
      songRepository: songRepository,
      songId: song.id,
    );

    verify(() => songRepository.fetchSongId(song.id, lang: 'Default'))
        .called(1);

    /// Verify widget visibility
    await r.expectTagsVisible(true);
    await r.expectArtistsVisible(true);

    await r.scrollDown();
    await tester.pump();

    await r.expectPVsVisible(true);
    await r.expectAlbumsVisible(true);
    await r.expectAltSongsVisible(true);

    await r.scrollDown();
    await tester.pump();

    verify(() => songRepository.fetchSongsDerived(song.id)).called(1);
    verify(() => songRepository.fetchSongsRelated(song.id)).called(1);

    await r.expectSameLikeSongsVisible(true);
    await r.expectWebLinksVisible(true);
  });

  testWidgets('song detail screen with song detail all fields is default',
      (tester) async {
    /// Setup
    final r = SongRobot(tester);
    final songRepository = MockSongRepository();
    when(() => songRepository.fetchSongId(1))
        .thenAnswer((_) => Future.value(const Song(id: 1)));

    when(() => songRepository.fetchSongsDerived(1))
        .thenAnswer((_) => Future.value([]));

    when(() => songRepository.fetchSongsRelated(1)).thenAnswer(
      (_) => Future.value(const SongRelated()),
    );

    /// Pump screen
    await r.pumpSongDetailScreen(songRepository: songRepository, songId: 1);

    verify(() => songRepository.fetchSongId(1, lang: 'Default')).called(1);

    /// Verify widget visibility
    await r.expectTagsVisible(false);
    await r.expectArtistsVisible(false);

    await r.scrollDown();
    await tester.pump();

    await r.expectPVsVisible(false);
    await r.expectAlbumsVisible(false);
    await r.expectAltSongsVisible(false);

    await r.scrollDown();
    await tester.pump();

    verify(() => songRepository.fetchSongsDerived(1)).called(1);
    verify(() => songRepository.fetchSongsRelated(1)).called(1);

    await r.expectSameLikeSongsVisible(false);
    await r.expectWebLinksVisible(false);
  });

  testWidgets('song detail screen with fetch song detail failure',
      (tester) async {
    final r = SongRobot(tester);
    final songRepository = MockSongRepository();
    when(() => songRepository.fetchSongId(1)).thenThrow(
      Exception('Connection error'),
    );

    await r.pumpSongDetailScreen(songRepository: songRepository, songId: 1);

    verify(() => songRepository.fetchSongId(1)).called(1);
  });
}
