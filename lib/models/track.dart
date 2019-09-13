import 'package:vocadb/models/song.dart';

class Track {
  int id;
  int discNumber;
  String name;
  Song song;
  int trackNumber;

  Track();

  Track.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        discNumber = json['discNumber'],
        trackNumber = json['trackNumber'],
        song = json.containsKey('song') ? Song.fromJson(json['song']) : null;
}
