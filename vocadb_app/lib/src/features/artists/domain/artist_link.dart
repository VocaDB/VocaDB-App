// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import "package:collection/collection.dart";

import 'package:vocadb_app/src/features/artists/domain/artist.dart';

class ArtistLink {
  final String linkType;

  final Artist artist;

  const ArtistLink({
    required this.linkType,
    required this.artist,
  });

  ArtistLink copyWith({
    String? linkType,
    Artist? artist,
  }) {
    return ArtistLink(
      linkType: linkType ?? this.linkType,
      artist: artist ?? this.artist,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'linkType': linkType,
      'artist': artist.toMap(),
    };
  }

  factory ArtistLink.fromMap(Map<String, dynamic> map) {
    return ArtistLink(
      linkType: map['linkType'] as String,
      artist: Artist.fromMap(map['artist'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArtistLink.fromJson(String source) =>
      ArtistLink.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ArtistLink(linkType: $linkType, artist: $artist)';

  @override
  bool operator ==(covariant ArtistLink other) {
    if (identical(this, other)) return true;

    return other.linkType == linkType && other.artist == artist;
  }

  @override
  int get hashCode => linkType.hashCode ^ artist.hashCode;
}

extension ArtistLinkList on List<ArtistLink> {
  Map<String, dynamic> get groupByLinkType => groupBy(this, (ArtistLink l) {
        return l.linkType;
      });
}
