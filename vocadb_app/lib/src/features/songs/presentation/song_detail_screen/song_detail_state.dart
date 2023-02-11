import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/domain/song_related.dart';

part 'song_detail_state.freezed.dart';

@freezed
class SongDetailState with _$SongDetailState {
  const factory SongDetailState({
    required AsyncValue<Song> song,
    @Default(AsyncValue.data(SongRelated()))
        AsyncValue<SongRelated> relatedSongs,
    @Default(AsyncValue.data([])) AsyncValue<List<Song>> derivedSongs,
    @Default(false) bool showLyricContent,
    @Default(AsyncValue.data(null)) AsyncValue<String?> rating,
  }) = _SongDetailState;
}
