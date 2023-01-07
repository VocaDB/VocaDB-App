import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

part 'song_related.freezed.dart';
part 'song_related.g.dart';

@freezed
class SongRelated with _$SongRelated {
  const factory SongRelated({
    @Default([]) List<Song> artistMatches,
    @Default([]) List<Song> likeMatches,
    @Default([]) List<Song> tagMatches,
  }) = _SongRelated;

  factory SongRelated.fromJson(Map<String, dynamic> json) =>
      _$SongRelatedFromJson(json);
}
