import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:vocadb/models/models.dart';

abstract class SongListState extends Equatable {
  const SongListState();

  @override
  List<Object> get props => [];
}

class SongListInitial extends SongListState {}

class SongListEmpty extends SongListState {}

class SongListLoaded extends SongListState {
  final List<SongModel> songs;
  final bool hasReachedMax;

  const SongListLoaded({this.songs = const [], this.hasReachedMax});

  SongListLoaded copyWith({
    List<SongModel> posts,
    bool hasReachedMax,
  }) {
    return SongListLoaded(
      songs: songs ?? this.songs,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [songs, hasReachedMax];

  @override
  String toString() =>
      'SongListLoaded { songs: ${songs.length}, hasReachedMax: $hasReachedMax }';
}

class SongListError extends SongListState {}
