import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'followed_artist.freezed.dart';
part 'followed_artist.g.dart';

@freezed
class FollowedArtist with _$FollowedArtist {
  factory FollowedArtist({
    required int id,
    required Artist artist,
  }) = _FollowedArtist;

  factory FollowedArtist.fromJson(Map<String, dynamic> json) =>
      _$FollowedArtistFromJson(json);

  static List<FollowedArtist> fromJsonToList(List<dynamic> source) {
    return source.map((e) => FollowedArtist.fromJson(e)).toList();
  }
}
