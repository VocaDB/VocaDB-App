import 'package:vocadb_app/models.dart';

class ArtistRelations {
  List<SongModel> latestSongs;
  List<SongModel> popularSongs;
  List<AlbumModel> latestAlbums;
  List<AlbumModel> popularAlbums;

  ArtistRelations.fromJson(Map<String, dynamic> json)
      : latestSongs = (json.containsKey('latestSongs'))
            ? (json['latestSongs'] as List)
                ?.map((d) => (d is int) ? null : SongModel.fromJson(d))
                ?.toList()
            : [],
        popularSongs = (json.containsKey('popularSongs'))
            ? (json['popularSongs'] as List)
                ?.map((d) => (d is int) ? null : SongModel.fromJson(d))
                ?.toList()
            : [],
        latestAlbums = (json.containsKey('latestAlbums'))
            ? (json['latestAlbums'] as List)
                ?.map((d) => (d is int) ? null : AlbumModel.fromJson(d))
                ?.toList()
            : [],
        popularAlbums = (json.containsKey('popularAlbums'))
            ? (json['popularAlbums'] as List)
                ?.map((d) => (d is int) ? null : AlbumModel.fromJson(d))
                ?.toList()
            : [];
}
