import 'package:equatable/equatable.dart';

abstract class SongListEvent extends Equatable {
  const SongListEvent();
}

class FetchSongsList extends SongListEvent {
  @override
  List<Object> get props => [];
}

class FetchMoreSongs extends SongListEvent {
  final int lastIndex;

  const FetchMoreSongs({this.lastIndex});

  @override
  List<Object> get props => [];
}
