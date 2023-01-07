// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/domain/song_related.dart';

class SongDetailState {
  final AsyncValue<Song> song;
  final AsyncValue<SongRelated> relatedSongs;
  SongDetailState({
    required this.song,
    this.relatedSongs = const AsyncValue.data(SongRelated()),
  });

  SongDetailState.loading({
    this.song = const AsyncValue.loading(),
    this.relatedSongs = const AsyncValue.data(SongRelated()),
  });

  SongDetailState copyWith({
    AsyncValue<Song>? song,
    AsyncValue<SongRelated>? relatedSongs,
  }) {
    return SongDetailState(
      song: song ?? this.song,
      relatedSongs: relatedSongs ?? this.relatedSongs,
    );
  }

  @override
  String toString() =>
      'SongDetailState(song: $song, relatedSongs: $relatedSongs)';

  @override
  bool operator ==(covariant SongDetailState other) {
    if (identical(this, other)) return true;

    return other.song == song && other.relatedSongs == relatedSongs;
  }

  @override
  int get hashCode => song.hashCode ^ relatedSongs.hashCode;
}
