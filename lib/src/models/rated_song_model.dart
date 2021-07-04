import 'package:equatable/equatable.dart';
import 'package:vocadb_app/models.dart';

class RatedSongModel extends Equatable {
  final SongModel song;
  final String rating;
  final DateTime date;

  RatedSongModel({this.song, this.rating, this.date});

  @override
  List<Object> get props => [song, rating, date];

  RatedSongModel.fromJson(Map<String, dynamic> json)
      : date = (json['date'] != null) ? DateTime.parse(json['date']) : null,
        rating = json['rating'],
        song =
            json.containsKey('song') ? SongModel.fromJson(json['song']) : null;

  static List<RatedSongModel> jsonToList(List items) {
    return (items == null)
        ? []
        : items.map((i) => RatedSongModel.fromJson(i)).toList();
  }
}
