import 'package:vocadb_app/models.dart';
import "package:collection/collection.dart";

class TrackModel {
  int id;
  int discNumber;
  String name;
  SongModel song;
  int trackNumber;

  TrackModel(
      {this.id, this.trackNumber, this.discNumber, this.name, this.song});

  TrackModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        discNumber = json['discNumber'],
        trackNumber = json['trackNumber'],
        song =
            json.containsKey('song') ? SongModel.fromJson(json['song']) : null;

  String toString() {
    return {
      "id": id,
      "trackNumber": trackNumber,
      "discNumber": discNumber,
      "name": name
    }.toString();
  }
}

class TrackList {
  final List<TrackModel> tracks;

  const TrackList(this.tracks);

  Map<String, dynamic> get groupByDisc => groupBy(tracks, (TrackModel l) {
        return l.discNumber.toString();
      });
}
