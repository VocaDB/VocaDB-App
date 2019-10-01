import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/artist_song_model.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/pv_model.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/web_service.dart';
import 'package:vocadb/utils/json_utils.dart';

class SongModel extends EntryModel {
  EntryType entryType = EntryType.Song;
  String thumbUrl;
  List<PVModel> pvs;
  List<ArtistSongModel> artists;
  List<AlbumModel> albums;
  int originalVersionId;
  String publishDate;

  SongModel();

  SongModel.fromJson(Map<String, dynamic> json)
      : thumbUrl = json['thumbUrl'],
        originalVersionId = json['originalVersionId'],
        publishDate = json['publishDate'],
        pvs = JSONUtils.mapJsonArray<PVModel>(
            json['pvs'], (v) => PVModel.fromJson(v)),
        artists = JSONUtils.mapJsonArray<ArtistSongModel>(
            json['artists'], (v) => ArtistSongModel.fromJson(v)),
        albums = JSONUtils.mapJsonArray<AlbumModel>(
            json['albums'], (v) => AlbumModel.fromJson(v)),
        super.fromJson(json);

  static List<SongModel> jsonToList(List items) {
    return items.map((i) => SongModel.fromJson(i)).toList();
  }

  PVModel get youtubePV =>
      pvs?.firstWhere((pv) => pv.service.toLowerCase() == "youtube",
          orElse: () => null);

  List<TagModel> get tags =>
      (this.tagGroups != null) ? this.tagGroups.map((t) => t.tag).toList() : [];

  List<ArtistSongModel> get producers =>
      this.artists.where((a) => a.isProducer).toList();

  List<ArtistSongModel> get vocalists =>
      this.artists.where((a) => a.isVocalist).toList();

  List<ArtistSongModel> get otherArtists =>
      this.artists.where((a) => !a.isVocalist && !a.isProducer).toList();

  bool get hasOriginalVersion =>
      (this.originalVersionId != null && this.originalVersionId > 0);

  String get publishDateFormatted =>
      DateFormat('yyyy-MM-dd').format(DateTime.parse(publishDate));

  static List<SongModel> _mapItemsResponse(Response response) {
    Iterable result = response.data['items'];
    return result.map((model) => SongModel.fromJson(model)).toList();
  }

  static Resource<List<SongModel>> latestByTagId(int tagId) {
    return Resource(
        endpoint: '/api/songs?tagId=$tagId&fields=ThumbUrl&sort=AdditionDate',
        parse: _mapItemsResponse);
  }

  static Resource<List<SongModel>> topByTagId(int tagId) {
    return Resource(
        endpoint: '/api/songs?tagId=$tagId&fields=ThumbUrl&sort=RatingScore',
        parse: _mapItemsResponse);
  }
}

class SongList {
  final List<SongModel> songs;

  SongList(this.songs);

  SongModel getFirstWithYoutubePV({int start = 0}) {
    if (start == 0) {
      return this
          .songs
          .firstWhere((s) => s.youtubePV != null, orElse: () => null);
    }

    int index = this.songs.indexWhere((s) => s.youtubePV != null, start);

    return (index == -1) ? null : this.songs[index];
  }

  int getFirstWithYoutubePVIndex(int start) {
    int index = this.songs.indexWhere((s) => s.youtubePV != null, start);

    return index;
  }

  int getLastWithYoutubePVIndex(int start) {
    int index = this.songs.lastIndexWhere((s) => s.youtubePV != null, start);

    return index;
  }
}

class RankDuration {
  static const int DAILY = 24;
  static const int WEEKLY = 168;
  static const int MONTHLY = 720;
  static const int OVERALL = 0;
}
