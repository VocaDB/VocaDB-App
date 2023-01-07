// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vocadb_app/src/features/songs/domain/song.dart';

class SongDetailState {
  final AsyncValue<Song> song;
  SongDetailState({
    required this.song,
  });

  SongDetailState copyWith({
    AsyncValue<Song>? song,
  }) {
    return SongDetailState(
      song: song ?? this.song,
    );
  }

  @override
  String toString() => 'SongDetailState(song: $song)';

  @override
  bool operator ==(covariant SongDetailState other) {
    if (identical(this, other)) return true;

    return other.song == song;
  }

  @override
  int get hashCode => song.hashCode;
}
