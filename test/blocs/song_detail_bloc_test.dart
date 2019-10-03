import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/song_detail_bloc.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/song_rest_service.dart';

class MockSongRestService extends Mock implements SongRestService {}

class MockConfigBloc extends Mock implements ConfigBloc {}

main() {

  MockConfigBloc mockConfigBloc = MockConfigBloc();

  final List<SongModel> mockResults = [
    SongModel.fromJson({'id': 1, 'name': 'A'}),
    SongModel.fromJson({'id': 2, 'name': 'B'}),
    SongModel.fromJson({'id': 3, 'name': 'C'}),
    SongModel.fromJson({'id': 4, 'name': 'D'}),
  ];

  final SongModel mockSingleResult = SongModel.fromJson({'id': 1, 'name': 'A'});

  setUp(() {
    when(mockConfigBloc.contentLang).thenReturn('Default');
  });
  test('should emits results when fetch by id', () async {
    MockSongRestService mockSongService = MockSongRestService();

    when(mockSongService.byId(any))
        .thenAnswer((_) => Future.value(mockSingleResult));
    when(mockSongService.related(any))
        .thenAnswer((_) => Future.value(mockResults));
    when(mockSongService.derived(any))
        .thenAnswer((_) => Future.value(mockResults));

    SongDetailBloc bloc = new SongDetailBloc(1,
        songService: mockSongService, configBloc: mockConfigBloc);

    await expectLater(bloc.song$, emits(mockSingleResult));
    await expectLater(bloc.altVersions$, emits(mockResults));
    await expectLater(bloc.relatedSongs$, emits(mockResults));

    verify(mockSongService.byId(any)).called(1);
    verify(mockSongService.related(any)).called(1);
    verify(mockSongService.derived(any)).called(1);
  });

  test('should emits original version', () async {
    MockSongRestService mockSongService = MockSongRestService();

    int originalSongId = 5;
    int songId = 1;
    SongModel mockSingleResultWithOriginal = SongModel.fromJson({
      'id': songId,
      'name': 'withOriginalAA',
      'originalVersionId': originalSongId
    });

    when(mockSongService.byId(songId))
        .thenAnswer((_) => Future.value(mockSingleResultWithOriginal));
    when(mockSongService.byId(originalSongId))
        .thenAnswer((_) => Future.value(mockSingleResult));
    when(mockSongService.related(any))
        .thenAnswer((_) => Future.value(mockResults));
    when(mockSongService.derived(any))
        .thenAnswer((_) => Future.value(mockResults));

    SongDetailBloc bloc = new SongDetailBloc(songId,
        songService: mockSongService, configBloc: mockConfigBloc);

    // bloc = new SongDetailBloc(1, songService: mockSongService, configBloc: mockConfigBloc);

    await expectLater(bloc.song$, emits(mockSingleResultWithOriginal),
        reason: 'no emits song');
    await expectLater(bloc.originalVersion$, emits(mockSingleResult),
        reason: 'no emits original version');
    await expectLater(bloc.altVersions$, emits(mockResults));
    await expectLater(bloc.relatedSongs$, emits(mockResults));

    verify(mockSongService.byId(any)).called(2);
    verify(mockSongService.related(any)).called(1);
    verify(mockSongService.derived(any)).called(1);
  });

  test('should show/hide lyric', () async {
    MockSongRestService mockSongService = MockSongRestService();

    when(mockSongService.byId(any))
        .thenAnswer((_) => Future.value(mockSingleResult));
    when(mockSongService.related(any))
        .thenAnswer((_) => Future.value(mockResults));
    when(mockSongService.derived(any))
        .thenAnswer((_) => Future.value(mockResults));
        
    SongDetailBloc bloc = new SongDetailBloc(1,
        songService: mockSongService, configBloc: mockConfigBloc);

    await expectLater(bloc.showHideLyric$, emits(false));

    bloc.showLyric();

    await expectLater(bloc.showHideLyric$, emits(true));

    bloc.hideLyric();

    await expectLater(bloc.showHideLyric$, emits(false));
  });
}
