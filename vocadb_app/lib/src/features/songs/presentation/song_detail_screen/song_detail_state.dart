// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/domain/song_related.dart';

class SongDetailState {
  final AsyncValue<Song> song;
  final AsyncValue<SongRelated> relatedSongs;
  final AsyncValue<List<Song>> derivedSongs;
  const SongDetailState({
    required this.song,
    this.relatedSongs = const AsyncValue.data(SongRelated()),
    this.derivedSongs = const AsyncValue.data([]),
  });

  SongDetailState.loading({
    this.song = const AsyncValue.loading(),
    this.relatedSongs = const AsyncValue.data(SongRelated()),
    this.derivedSongs = const AsyncValue.data([]),
  });

  SongDetailState copyWith({
    AsyncValue<Song>? song,
    AsyncValue<SongRelated>? relatedSongs,
    AsyncValue<List<Song>>? derivedSongs,
  }) {
    return SongDetailState(
      song: song ?? this.song,
      relatedSongs: relatedSongs ?? this.relatedSongs,
      derivedSongs: derivedSongs ?? this.derivedSongs,
    );
  }

  @override
  String toString() =>
      'SongDetailState(song: $song, relatedSongs: $relatedSongs, derivedSongs: $derivedSongs)';

  @override
  bool operator ==(covariant SongDetailState other) {
    if (identical(this, other)) return true;

    return other.song == song &&
        other.relatedSongs == relatedSongs &&
        other.derivedSongs == derivedSongs;
  }

  @override
  int get hashCode =>
      song.hashCode ^ relatedSongs.hashCode ^ derivedSongs.hashCode;
}
