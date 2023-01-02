// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:vocadb_app/src/features/songs/domain/song.dart';

class RatedSong {
  RatedSong({
    required this.song,
    required this.rating,
  });

  final Song song;

  final String rating;

  RatedSong copyWith({
    Song? song,
    String? rating,
  }) {
    return RatedSong(
      song: song ?? this.song,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'song': song.toMap(),
      'rating': rating,
    };
  }

  factory RatedSong.fromMap(Map<String, dynamic> map) {
    return RatedSong(
      song: Song.fromMap(map['song'] as Map<String, dynamic>),
      rating: map['rating'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RatedSong.fromJson(String source) =>
      RatedSong.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RatedSong(song: $song, rating: $rating)';

  @override
  bool operator ==(covariant RatedSong other) {
    if (identical(this, other)) return true;

    return other.song == song && other.rating == rating;
  }

  @override
  int get hashCode => song.hashCode ^ rating.hashCode;
}
