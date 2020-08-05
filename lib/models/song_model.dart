import 'package:intl/intl.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/artist_song_model.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/lyric_model.dart';
import 'package:vocadb/models/pv_model.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/utils/json_utils.dart';
import 'package:vocadb/utils/utils.dart';

class SongModel extends EntryModel {
  EntryType entryType = EntryType.Song;
  String thumbUrl;
  List<PVModel> pvs;
  List<ArtistSongModel> artists;
  List<AlbumModel> albums;
  int originalVersionId;
  String publishDate;
  List<LyricModel> lyrics;

  SongModel();

  SongModel.fromJson(Map<String, dynamic> json)
      : thumbUrl = UrlUtils.toHttps(json['thumbUrl']),
        originalVersionId = json['originalVersionId'],
        publishDate = json['publishDate'],
        pvs = JSONUtils.mapJsonArray<PVModel>(
            json['pvs'], (v) => (v is int) ? null : PVModel.fromJson(v)),
        artists = JSONUtils.mapJsonArray<ArtistSongModel>(json['artists'],
            (v) => (v is int) ? null : ArtistSongModel.fromJson(v)),
        albums = JSONUtils.mapJsonArray<AlbumModel>(
            json['albums'], (v) => (v is int) ? null : AlbumModel.fromJson(v)),
        lyrics = JSONUtils.mapJsonArray<LyricModel>(
            json['lyrics'], (v) => (v is int) ? null : LyricModel.fromJson(v)),
        super.fromJson(json);

  static List<SongModel> jsonToList(List items) {
    return (items == null)
        ? []
        : items.map((i) => SongModel.fromJson(i)).toList();
  }

  PVModel get youtubePV {
    return pvs?.firstWhere(
        (pv) =>
            pv.service.toLowerCase() == 'youtube' && pv.pvType == 'Original',
        orElse: () => pvs?.firstWhere(
            (pv) => pv.service.toLowerCase() == 'youtube',
            orElse: () => null));
  }

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

  String get publishDateFormatted => (publishDate == null)
      ? null
      : DateFormat('yyyy-MM-dd').format(DateTime.parse(publishDate));

  bool get hasLyrics => lyrics != null && lyrics.length > 0;

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();

    if (pvs != null) {
      json['pvs'] = pvs.map((pv) => pv.toJson()).toList();
    }

    if (thumbUrl != null) {
      json['thumbUrl'] = thumbUrl;
    }

    return json;
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
