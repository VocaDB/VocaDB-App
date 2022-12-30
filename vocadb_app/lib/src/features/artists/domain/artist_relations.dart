// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

class ArtistRelations {
  final List<Song> latestSongs;
  final List<Song> popularSongs;
  final List<Album> latestAlbums;
  final List<Album> popularAlbums;

  const ArtistRelations({
    this.latestSongs = const [],
    this.popularSongs = const [],
    this.latestAlbums = const [],
    this.popularAlbums = const [],
  });
}
