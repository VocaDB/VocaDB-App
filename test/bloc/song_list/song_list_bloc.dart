import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/models/models.dart';
import 'package:vocadb/models/user_cookie.dart';
import 'package:vocadb/repositories/repositories.dart';

class MockSongRepository extends Mock implements SongRepository {}

class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  SongListBloc songListBloc;
  MockSongRepository songRepository;

  setUp(() {
    songRepository = MockSongRepository();
    songListBloc = SongListBloc(songRepository: songRepository);
  });

  tearDown(() {
    songListBloc?.close();
  });

  test('should assert if null', () {
    expect(() => SongListBloc(songRepository: null), throwsA(isAssertionError));
  });
  test('initial state is correct', () {
    expect(songListBloc.initialState, SongListInitial());
  });

  test('close does not emit new states', () {
    expectLater(
      songListBloc,
      emitsInOrder([SongListInitial(), emitsDone]),
    );
    songListBloc.close();
  });

  group('Bloc test', () {
    final mockSongs = [
      SongModel.fromJson({'id': 1, 'name': 'A'}),
      SongModel.fromJson({'id': 2, 'name': 'B'})
    ];

    blocTest(
      'emits [SongListLoaded] when fetch songs succeeds',
      build: () async {
        when(songRepository.findAll())
            .thenAnswer((_) => Future.value(mockSongs));
        return songListBloc;
      },
      act: (bloc) => bloc.add(FetchSongsList()),
      wait: const Duration(milliseconds: 600),
      expect: [
        SongListLoaded(songs: mockSongs, hasReachedMax: false),
      ],
    );
  });
}
