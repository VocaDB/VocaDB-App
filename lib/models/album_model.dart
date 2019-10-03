import 'package:dio/dio.dart';
import 'package:vocadb/models/artist_album_model.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/release_date_model.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/models/track_model.dart';
import 'package:vocadb/services/web_service.dart';
import 'package:vocadb/utils/json_utils.dart';

class AlbumModel extends EntryModel {
  EntryType entryType = EntryType.Album;
  List<TrackModel> tracks;
  List<ArtistAlbumModel> artists;
  String catalogNumber;
  String description;
  double ratingAverage;
  int ratingCount;
  ReleaseDateModel releaseDate;

  AlbumModel();

  AlbumModel.fromJson(Map<String, dynamic> json)
      : catalogNumber = json['catalogNumber'],
        description = json['description'],
        ratingAverage = json['ratingAverage'],
        ratingCount = json['ratingCount'],
        tracks = JSONUtils.mapJsonArray<TrackModel>(
            json['tracks'], (v) => TrackModel.fromJson(v)),
        artists = JSONUtils.mapJsonArray<ArtistAlbumModel>(
            json['artists'], (v) => ArtistAlbumModel.fromJson(v)),
        releaseDate = json.containsKey('releaseDate')
            ? ReleaseDateModel.fromJson(json['releaseDate'])
            : null,
        super.fromJson(json);

  static List<AlbumModel> jsonToList(List items) {
    return items.map((i) => AlbumModel.fromJson(i)).toList();
  }

  List<ArtistAlbumModel> get producers =>
      this.artists.where((a) => a.isProducer).toList();

  List<ArtistAlbumModel> get vocalists =>
      this.artists.where((a) => a.isVocalist).toList();

  List<ArtistAlbumModel> get otherArtists =>
      this.artists.where((a) => !a.isVocalist && !a.isProducer).toList();

  static AlbumModel _mapObjectResponse(Response response) {
    return AlbumModel.fromJson(response.data);
  }

  static Resource<AlbumModel> byId(int id) {
    return Resource(
        endpoint: '/api/albums/$id?fields=Tracks,Tags',
        parse: _mapObjectResponse);
  }

  get imageUrl => (mainPicture != null && mainPicture.urlThumb != null)
      ? mainPicture.urlThumb
      : 'https://vocadb.net/Album/CoverPicture/$id';

  List<TagModel> get tags =>
      (this.tagGroups != null) ? this.tagGroups.map((t) => t.tag).toList() : [];
}
