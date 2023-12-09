import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

part 'main_screen_state.freezed.dart';

@freezed
class MainScreenState with _$MainScreenState {
  factory MainScreenState({
    @Default(0) int tabIndex,
    AsyncValue<List<ReleaseEvent>>? recentEvents,
    AsyncValue<List<Song>>? highlightedSongs,
    AsyncValue<List<Album>>? topAlbums,
    AsyncValue<List<Album>>? newAlbums,
  }) = _MainScreenState;
}
