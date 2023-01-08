// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/domain/song_related.dart';

class SongDetailState {
  final AsyncValue<Song> song;
  final AsyncValue<SongRelated> relatedSongs;
  final AsyncValue<List<Song>> derivedSongs;
  final bool showLyricContent;
  const SongDetailState({
    required this.song,
    this.relatedSongs = const AsyncValue.data(SongRelated()),
    this.derivedSongs = const AsyncValue.data([]),
    this.showLyricContent = false,
  });

  SongDetailState.loading({
    this.song = const AsyncValue.loading(),
    this.relatedSongs = const AsyncValue.data(SongRelated()),
    this.derivedSongs = const AsyncValue.data([]),
    this.showLyricContent = false,
  });

  SongDetailState copyWith({
    AsyncValue<Song>? song,
    AsyncValue<SongRelated>? relatedSongs,
    AsyncValue<List<Song>>? derivedSongs,
    bool? showLyricContent,
  }) {
    return SongDetailState(
      song: song ?? this.song,
      relatedSongs: relatedSongs ?? this.relatedSongs,
      derivedSongs: derivedSongs ?? this.derivedSongs,
      showLyricContent: showLyricContent ?? this.showLyricContent,
    );
  }

  @override
  String toString() {
    return 'SongDetailState(song: $song, relatedSongs: $relatedSongs, derivedSongs: $derivedSongs, showLyricContent: $showLyricContent)';
  }

  @override
  bool operator ==(covariant SongDetailState other) {
    if (identical(this, other)) return true;

    return other.song == song &&
        other.relatedSongs == relatedSongs &&
        other.derivedSongs == derivedSongs &&
        other.showLyricContent == showLyricContent;
  }

  @override
  int get hashCode {
    return song.hashCode ^
        relatedSongs.hashCode ^
        derivedSongs.hashCode ^
        showLyricContent.hashCode;
  }
}
