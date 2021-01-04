import 'package:intl/intl.dart';
import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/utils.dart';

class SongModel extends EntryModel {
  String thumbUrl;
  List<PVModel> pvs;
  List<ArtistSongModel> artists;
  List<AlbumModel> albums;
  int originalVersionId;
  String publishDate;
  List<LyricModel> lyrics;

  SongModel(
      {int id,
      String name,
      String songType,
      String artistString,
      this.thumbUrl})
      : super(
            id: id,
            name: name,
            artistString: artistString,
            songType: songType,
            entryType: EntryType.Song);

  SongModel.fromJson(Map<String, dynamic> json)
      : thumbUrl = UrlUtils.toHttps(json['thumbUrl']),
        originalVersionId = json['originalVersionId'],
        publishDate = json['publishDate'],
        pvs = JSONUtils.mapJsonArray<PVModel>(
            json['pvs'], (v) => (v is int) ? [] : PVModel.fromJson(v)),
        artists = JSONUtils.mapJsonArray<ArtistSongModel>(json['artists'],
            (v) => (v is int) ? [] : ArtistSongModel.fromJson(v)),
        albums = JSONUtils.mapJsonArray<AlbumModel>(
            json['albums'], (v) => (v is int) ? [] : AlbumModel.fromJson(v)),
        lyrics = JSONUtils.mapJsonArray<LyricModel>(
            json['lyrics'], (v) => (v is int) ? [] : LyricModel.fromJson(v)),
        super.fromJson(json, entryType: EntryType.Song);

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

  DateTime get publishDateAsDateTime =>
      (publishDate == null) ? null : DateTime.parse(publishDate);

  bool get hasLyrics => lyrics != null && lyrics.length > 0;

  String get originUrl => '$baseUrl/S/${this.id}';

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
