@Timeout(Duration(milliseconds: 2000))
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/settings/data/constants/preferred_lang.dart';
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
    final authRepository = MockAuthRepository();
    final song = kFakeSongDetail;

    /// Mock
    callFetchSongId() =>
        songRepository.fetchSongId(song.id, lang: PreferredLang.Default.name);
    callFetchSongDerived() => songRepository.fetchSongsDerived(song.id,
        lang: PreferredLang.Default.name);
    callFetchSongRelated() => songRepository.fetchSongsRelated(song.id,
        lang: PreferredLang.Default.name);

    when(callFetchSongId).thenAnswer((_) => Future.value(song));
    when(callFetchSongDerived).thenAnswer((_) => Future.value([
          const Song(id: 1, name: 'Song_A'),
          const Song(id: 2, name: 'Song_B'),
        ]));

    when(callFetchSongRelated).thenAnswer(
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
      authRepository: authRepository,
      songId: song.id,
    );

    // Verify
    verify(callFetchSongId).called(1);
    verify(callFetchSongDerived).called(1);
    verify(callFetchSongRelated).called(1);

    await r.expectTagsVisible(true);
    await r.expectArtistsVisible(true);

    await r.scrollDown();
    await tester.pump();

    await r.expectPVsVisible(true);
    await r.expectAlbumsVisible(true);
    await r.expectAltSongsVisible(true);

    await r.scrollDown();
    await tester.pump();

    await r.expectSameLikeSongsVisible(true);
    await r.expectWebLinksVisible(true);

    // Verify no extra call
    verifyNever(callFetchSongId);
    verifyNever(callFetchSongDerived);
    verifyNever(callFetchSongRelated);
  });

  testWidgets('song detail screen with song detail all fields is default',
      (tester) async {
    /// Setup
    final r = SongRobot(tester);
    final songRepository = MockSongRepository();
    final authRepository = MockAuthRepository();
    const songId = 1;

    /// Mock
    callFetchSongId() =>
        songRepository.fetchSongId(songId, lang: PreferredLang.Default.name);
    callFetchSongDerived() => songRepository.fetchSongsDerived(songId,
        lang: PreferredLang.Default.name);
    callFetchSongRelated() => songRepository.fetchSongsRelated(songId,
        lang: PreferredLang.Default.name);

    when(callFetchSongId)
        .thenAnswer((_) => Future.value(const Song(id: songId)));
    when(callFetchSongDerived).thenAnswer((_) => Future.value([]));
    when(callFetchSongRelated).thenAnswer(
      (_) => Future.value(const SongRelated()),
    );

    /// Pump screen
    await r.pumpSongDetailScreen(
      songRepository: songRepository,
      authRepository: authRepository,
      songId: songId,
    );

    // Verify
    verify(callFetchSongId).called(1);
    verify(callFetchSongDerived).called(1);
    verify(callFetchSongRelated).called(1);

    await r.expectLyricButtonVisible(false);
    await r.expectTagsVisible(false);
    await r.expectArtistsVisible(false);

    await r.scrollDown();
    await tester.pump();

    await r.expectPVsVisible(false);
    await r.expectAlbumsVisible(false);
    await r.expectAltSongsVisible(false);

    await r.scrollDown();
    await tester.pump();

    await r.expectSameLikeSongsVisible(false);
    await r.expectWebLinksVisible(false);
  });

  testWidgets('song detail screen with fetch song detail failure',
      (tester) async {
    final r = SongRobot(tester);
    final songRepository = MockSongRepository();
    final authRepository = MockAuthRepository();
    const songId = 1;

    // Mock
    callFetchSongId() =>
        songRepository.fetchSongId(songId, lang: PreferredLang.Default.name);

    when(callFetchSongId).thenThrow(
      Exception('Connection error'),
    );

    await r.pumpSongDetailScreen(
      songRepository: songRepository,
      authRepository: authRepository,
      songId: songId,
    );

    verify(callFetchSongId).called(1);
  });

  testWidgets('song detail screen toggle lyric', (tester) async {
    /// Setup
    final r = SongRobot(tester);
    final songRepository = MockSongRepository();
    final authRepository = MockAuthRepository();
    final song = kFakeSongDetail;
    final songId = song.id;

    /// Mock
    callFetchSongId() =>
        songRepository.fetchSongId(songId, lang: PreferredLang.Default.name);
    callFetchSongDerived() => songRepository.fetchSongsDerived(songId,
        lang: PreferredLang.Default.name);
    callFetchSongRelated() => songRepository.fetchSongsRelated(songId,
        lang: PreferredLang.Default.name);

    // Mock
    when(callFetchSongId).thenAnswer((_) => Future.value(song));
    when(callFetchSongDerived).thenAnswer((_) => Future.value([]));
    when(callFetchSongRelated)
        .thenAnswer((_) => Future.value(const SongRelated()));

    /// Pump screen
    await r.pumpSongDetailScreen(
      songRepository: songRepository,
      authRepository: authRepository,
      songId: song.id,
    );

    verify(callFetchSongId).called(1);
    verify(callFetchSongDerived).called(1);
    verify(callFetchSongRelated).called(1);

    // /// Verify before tap lyric button
    await r.expectSongInfoContentVisible(true);
    await r.expectSongLyricContentVisible(false);
    await r.expectLyricButtonVisible(true);

    // /// Verify after tap lyric button
    await r.tapLyricButton();
    await r.expectSongInfoContentVisible(false);
    await r.expectSongLyricContentVisible(true);

    /// Verify after tap close lyric button
    await r.tapCloseLyricButton();
    await r.expectSongInfoContentVisible(true);
    await r.expectSongLyricContentVisible(false);
  });
  
  testWidgets('tap Info button in song detail screen',
      (tester) async {
    /// Setup
    final r = SongRobot(tester);
    final songRepository = MockSongRepository();
    final authRepository = MockAuthRepository();
    final urlLauncher = MockUrlLauncher();
    final song = kFakeSongDetail;

    /// Mock
    callFetchSongId() =>
        songRepository.fetchSongId(song.id, lang: PreferredLang.Default.name);
    callFetchSongDerived() => songRepository.fetchSongsDerived(song.id,
        lang: PreferredLang.Default.name);
    callFetchSongRelated() => songRepository.fetchSongsRelated(song.id,
        lang: PreferredLang.Default.name);

    when(callFetchSongId).thenAnswer((_) => Future.value(song));
    when(callFetchSongDerived).thenAnswer((_) => Future.value([
          const Song(id: 1, name: 'Song_A'),
          const Song(id: 2, name: 'Song_B'),
        ]));

    when(callFetchSongRelated).thenAnswer(
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
      authRepository: authRepository,
      songId: song.id,
      urlLauncher: urlLauncher,
    );

    // Verify
    verify(callFetchSongId).called(1);
    verify(callFetchSongDerived).called(1);
    verify(callFetchSongRelated).called(1);


    await tester.tap(find.text('Info'));
    await tester.pump();
    
    verify(() => urlLauncher.launchSongMoreInfo(1501)).called(1);
  });

}
