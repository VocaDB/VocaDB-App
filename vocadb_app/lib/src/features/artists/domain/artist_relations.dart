// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

class ArtistRelations {
  final List<Song> latestSongs;
  final List<Song> popularSongs;
  final List<Album> latestAlbums;
  final List<Album> popularAlbums;

  const ArtistRelations({
    this.latestSongs = const [],
    this.popularSongs = const [],
    this.latestAlbums = const [],
    this.popularAlbums = const [],
  });

  ArtistRelations copyWith({
    List<Song>? latestSongs,
    List<Song>? popularSongs,
    List<Album>? latestAlbums,
    List<Album>? popularAlbums,
  }) {
    return ArtistRelations(
      latestSongs: latestSongs ?? this.latestSongs,
      popularSongs: popularSongs ?? this.popularSongs,
      latestAlbums: latestAlbums ?? this.latestAlbums,
      popularAlbums: popularAlbums ?? this.popularAlbums,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latestSongs': latestSongs.map((x) => x.toMap()).toList(),
      'popularSongs': popularSongs.map((x) => x.toMap()).toList(),
      'latestAlbums': latestAlbums.map((x) => x.toMap()).toList(),
      'popularAlbums': popularAlbums.map((x) => x.toMap()).toList(),
    };
  }

  factory ArtistRelations.fromMap(Map<String, dynamic> map) {
    return ArtistRelations(
      latestSongs: List<Song>.from(
        (map['latestSongs'] as List<int>).map<Song>(
          (x) => Song.fromMap(x as Map<String, dynamic>),
        ),
      ),
      popularSongs: List<Song>.from(
        (map['popularSongs'] as List<int>).map<Song>(
          (x) => Song.fromMap(x as Map<String, dynamic>),
        ),
      ),
      latestAlbums: List<Album>.from(
        (map['latestAlbums'] as List<int>).map<Album>(
          (x) => Album.fromMap(x as Map<String, dynamic>),
        ),
      ),
      popularAlbums: List<Album>.from(
        (map['popularAlbums'] as List<int>).map<Album>(
          (x) => Album.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArtistRelations.fromJson(String source) =>
      ArtistRelations.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ArtistRelations(latestSongs: $latestSongs, popularSongs: $popularSongs, latestAlbums: $latestAlbums, popularAlbums: $popularAlbums)';
  }

  @override
  bool operator ==(covariant ArtistRelations other) {
    if (identical(this, other)) return true;

    return listEquals(other.latestSongs, latestSongs) &&
        listEquals(other.popularSongs, popularSongs) &&
        listEquals(other.latestAlbums, latestAlbums) &&
        listEquals(other.popularAlbums, popularAlbums);
  }

  @override
  int get hashCode {
    return latestSongs.hashCode ^
        popularSongs.hashCode ^
        latestAlbums.hashCode ^
        popularAlbums.hashCode;
  }
}
