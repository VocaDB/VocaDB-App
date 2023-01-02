// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:vocadb_app/src/features/songs/domain/song.dart';

class Track {
  final int id;
  final int discNumber;
  final Song song;
  final int trackNumber;
  Track({
    required this.id,
    required this.discNumber,
    required this.song,
    required this.trackNumber,
  });

  Track copyWith({
    int? id,
    int? discNumber,
    Song? song,
    int? trackNumber,
  }) {
    return Track(
      id: id ?? this.id,
      discNumber: discNumber ?? this.discNumber,
      song: song ?? this.song,
      trackNumber: trackNumber ?? this.trackNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'discNumber': discNumber,
      'song': song.toMap(),
      'trackNumber': trackNumber,
    };
  }

  factory Track.fromMap(Map<String, dynamic> map) {
    return Track(
      id: map['id'] as int,
      discNumber: map['discNumber'] as int,
      song: Song.fromMap(map['song'] as Map<String, dynamic>),
      trackNumber: map['trackNumber'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Track.fromJson(String source) =>
      Track.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Track(id: $id, discNumber: $discNumber, song: $song, trackNumber: $trackNumber)';
  }

  @override
  bool operator ==(covariant Track other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.discNumber == discNumber &&
        other.song == song &&
        other.trackNumber == trackNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        discNumber.hashCode ^
        song.hashCode ^
        trackNumber.hashCode;
  }
}

extension TracksList on List<Track> {
  Map<String, List<Track>> get groupByDisc => groupBy(this, (Track l) {
        return l.discNumber.toString();
      });
}
