import 'package:vocadb_app/models.dart';

class RatedSongModel {
  DateTime date;
  SongModel song;
  String rating;

  RatedSongModel.fromJson(Map<String, dynamic> json)
      : date = DateTime.parse(json['date']),
        rating = json['rating'],
        song =
            json.containsKey('song') ? SongModel.fromJson(json['song']) : null;

  static List<RatedSongModel> jsonToList(List items) {
    return (items == null)
        ? []
        : items.map((i) => RatedSongModel.fromJson(i)).toList();
  }
}
