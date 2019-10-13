import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/models/base_model.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/utils/json_utils.dart';

class ProfileModel extends BaseModel {
  List<ArtistModel> followedArtists;
  List<SongModel> favoriteSongs;
  List<AlbumModel> favoriteAlbums;

  ProfileModel();

  ProfileModel.fromJson(Map<String, dynamic> json)
      : followedArtists = JSONUtils.mapJsonArray<ArtistModel>(
            json['followedArtists'], (v) => ArtistModel.fromJson(v)),
        favoriteSongs = JSONUtils.mapJsonArray<SongModel>(
            json['favoriteSongs'], (v) => SongModel.fromJson(v)),
        favoriteAlbums = JSONUtils.mapJsonArray<AlbumModel>(
            json['favoriteAlbums'], (v) => AlbumModel.fromJson(v)),
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return {
      'followedArtists': followedArtists.map((v) => v.toJson()).toList(),
      'favoriteSongs': favoriteSongs.map((v) => v.toJson()).toList(),
      'favoriteAlbums': favoriteAlbums.map((v) => v.toJson()).toList(),
    };
  }
}
