import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/repositories/repositories.dart';

class SongListBloc extends Bloc<SongListEvent, SongListState> {
  final SongRepository songRepository;

  SongListBloc({@required this.songRepository})
      : assert(songRepository != null);

  @override
  SongListState get initialState => SongListInitial();

  @override
  Stream<SongListState> mapEventToState(SongListEvent event) async* {
    final currentState = state;
    if (event is FetchSongsList && !_hasReachedMax(currentState)) {
      try {
        if (currentState is SongListInitial) {
          final songs = await songRepository.findAll();
          yield SongListLoaded(songs: songs, hasReachedMax: false);
        }

        if (currentState is SongListLoaded) {
          final songs =
              await songRepository.findAll(start: currentState.songs.length);
          yield songs.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : SongListLoaded(
                  songs: currentState.songs + songs, hasReachedMax: false);
        }
      } catch (_) {
        yield SongListError();
      }
    }
  }

  bool _hasReachedMax(SongListState state) =>
      state is SongListLoaded && state.hasReachedMax;

  @override
  Stream<Transition<SongListEvent, SongListState>> transformEvents(
    Stream<SongListEvent> events,
    TransitionFunction<SongListEvent, SongListState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }
}
