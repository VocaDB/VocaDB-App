import 'package:dio/dio.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/models/track_model.dart';
import 'package:vocadb/services/web_service.dart';
import 'package:vocadb/utils/json_utils.dart';

class AlbumModel extends EntryModel {

  EntryType entryType = EntryType.Album;
  List<TrackModel> tracks;

  AlbumModel();

  AlbumModel.fromJson(Map<String, dynamic> json)
      : tracks = JSONUtils.mapJsonArray<TrackModel>(json['tracks'], (v) => TrackModel.fromJson(v)),
        super.fromJson(json);

  static AlbumModel _mapObjectResponse(Response response) {
    return AlbumModel.fromJson(response.data);
  }

  static List<AlbumModel> _mapArrayResponse(Response response) {
    Iterable result = response.data;
    return result.map((model) => AlbumModel.fromJson(model)).toList();
  }

  static Resource<AlbumModel> byId(int id) {
    return Resource(
        endpoint: '/api/albums/$id?fields=Tracks,Tags',
        parse: _mapObjectResponse);
  }

  static Resource<List<AlbumModel>> get all {
    return Resource(
        endpoint: '/api/albums/new?fields=MainPicture',
        parse: _mapArrayResponse);
  }

  static Resource<List<AlbumModel>> get top {
    return Resource(
        endpoint: '/api/albums/top?fields=MainPicture',
        parse: _mapArrayResponse);
  }

  get imageUrl => (mainPicture != null && mainPicture.urlThumb != null)
      ? mainPicture.urlThumb
      : 'https://vocadb.net/Album/CoverPicture/$id';

  List<TagModel> get tags =>
      (this.tagGroups != null) ? this.tagGroups.map((t) => t.tag).toList() : [];
}
