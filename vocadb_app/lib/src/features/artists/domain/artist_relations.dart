import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

part 'artist_relations.freezed.dart';
part 'artist_relations.g.dart';

@freezed
class ArtistRelations with _$ArtistRelations {
  factory ArtistRelations({
    @Default([]) List<Song> latestSongs,
    @Default([]) List<Song> popularSongs,
    @Default([]) List<Album> latestAlbums,
    @Default([]) List<Album> popularAlbums,
  }) = _ArtistRelations;

  factory ArtistRelations.fromJson(Map<String, dynamic> json) =>
      _$ArtistRelationsFromJson(json);
}
