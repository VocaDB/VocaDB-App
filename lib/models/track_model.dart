import 'package:vocadb/models/song_model.dart';

class TrackModel {
  int id;
  int discNumber;
  String name;
  SongModel song;
  int trackNumber;

  TrackModel();

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
