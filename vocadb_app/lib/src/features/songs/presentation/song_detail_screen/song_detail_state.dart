// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:vocadb_app/src/features/songs/domain/song.dart';

class SongDetailState {
  final Song song;
  final bool isLoading;
  SongDetailState({
    required this.song,
    this.isLoading = false,
  });

  SongDetailState copyWith({
    Song? song,
    bool? isLoading,
  }) {
    return SongDetailState(
      song: song ?? this.song,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
