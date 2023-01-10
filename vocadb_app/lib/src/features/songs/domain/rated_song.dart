import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rated_song.freezed.dart';
part 'rated_song.g.dart';

@freezed
class RatedSong with _$RatedSong {
  factory RatedSong({
    required String rating,
    required Song song,
  }) = _RatedSong;

  factory RatedSong.fromJson(Map<String, dynamic> json) =>
      _$RatedSongFromJson(json);

  static List<RatedSong> fromJsonToList(List<dynamic> source) {
    return source.map((e) => RatedSong.fromJson(e)).toList();
  }
}
