// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:vocadb_app/src/features/artists/domain/artist.dart';

class FollowedArtist {
  final int id;
  final Artist artist;

  const FollowedArtist({
    required this.id,
    required this.artist,
  });

  FollowedArtist copyWith({
    int? id,
    Artist? artist,
  }) {
    return FollowedArtist(
      id: id ?? this.id,
      artist: artist ?? this.artist,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'artist': artist.toMap(),
    };
  }

  factory FollowedArtist.fromMap(Map<String, dynamic> map) {
    return FollowedArtist(
      id: map['id'] as int,
      artist: Artist.fromMap(map['artist'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory FollowedArtist.fromJson(String source) =>
      FollowedArtist.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FollowedArtist(id: $id, artist: $artist)';

  @override
  bool operator ==(covariant FollowedArtist other) {
    if (identical(this, other)) return true;

    return other.id == id && other.artist == artist;
  }

  @override
  int get hashCode => id.hashCode ^ artist.hashCode;
}
