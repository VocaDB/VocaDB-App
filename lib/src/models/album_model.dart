import 'dart:collection';

import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/utils.dart';
import "package:collection/collection.dart";

class AlbumModel extends EntryModel {
  List<TrackModel> tracks;
  List<ArtistAlbumModel> artists;
  String catalogNumber;
  String description;
  double ratingAverage;
  int ratingCount;
  ReleaseDateModel releaseDate;

  AlbumModel({int id, String name, String artistString})
      : super(
            id: id,
            name: name,
            artistString: artistString,
            entryType: EntryType.Album);

  AlbumModel.fromJson(Map<String, dynamic> json)
      : catalogNumber = json['catalogNumber'],
        description = json['description'],
        ratingAverage = (json['ratingAverage'] is int)
            ? double.parse(json['ratingAverage'].toString())
            : json['ratingAverage'],
        ratingCount = json['ratingCount'],
        tracks = JSONUtils.mapJsonArray<TrackModel>(
            json['tracks'], (v) => TrackModel.fromJson(v)),
        artists = JSONUtils.mapJsonArray<ArtistAlbumModel>(
            json['artists'], (v) => ArtistAlbumModel.fromJson(v)),
        releaseDate = json.containsKey('releaseDate')
            ? ReleaseDateModel.fromJson(json['releaseDate'])
            : null,
        super.fromJson(json, entryType: EntryType.Album);

  static List<AlbumModel> jsonToList(List items) {
    return items.map((i) => AlbumModel.fromJson(i)).toList();
  }

  List<ArtistAlbumModel> get producers =>
      this.artists.where((a) => a.isProducer).toList();

  List<ArtistAlbumModel> get vocalists =>
      this.artists.where((a) => a.isVocalist).toList();

  List<ArtistAlbumModel> get labels =>
      this.artists.where((a) => a.isLabel).toList();

  List<ArtistAlbumModel> get otherArtists => this
      .artists
      .where((a) => !a.isVocalist && !a.isProducer && !a.isLabel)
      .toList();

  get imageUrl => (mainPicture != null && mainPicture.urlThumb != null)
      ? mainPicture.urlThumb
      : '$baseUrl/Album/CoverPicture/$id';

  String get releaseDateFormatted => releaseDate.formatted;

  bool get isContainsYoutubeTrack =>
      tracks.firstWhere((t) => t.song != null && t.song.youtubePV != null,
          orElse: () => null) !=
      null;

  List<TagModel> get tags =>
      (this.tagGroups != null) ? this.tagGroups.map((t) => t.tag).toList() : [];

  List<AlbumDiscModel> discs() {
    return SplayTreeMap.of(groupBy(tracks, (t) => t.discNumber))
        .values
        .map((v) => AlbumDiscModel(v[0].discNumber, v))
        .toList();
  }
}
