// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/pvs/domain/pv.dart';
import 'package:vocadb_app/src/features/songs/domain/lyric.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

class Song {
  const Song({
    required this.id,
    this.name,
    this.artistString,
    this.imageUrl,
    this.songType,
    this.pvServices = '',
    this.additionalNames = '',
    this.createDate = '',
    this.favoritedTimes = 0,
    this.lengthSeconds = 0,
    this.publishDate = '',
    this.ratingScore = 0,
    this.tagUsages = const [],
    this.artistRoles = const [],
    this.albums = const [],
    this.lyrics = const [],
    this.pvs = const [],
    this.webLinks = const [],
  });

  final int id;

  final String? name;

  final String? artistString;

  final String? imageUrl;

  final String? songType;

  final String? pvServices;

  final String? additionalNames;

  final String? createDate;

  final int? favoritedTimes;

  final int? lengthSeconds;

  final String? publishDate;

  final int? ratingScore;

  final List<TagUsage>? tagUsages;

  final List<ArtistRole>? artistRoles;

  final List<Album>? albums;

  final List<Lyric>? lyrics;

  final List<PV>? pvs;

  final List<WebLink>? webLinks;

  Song copyWith({
    int? id,
    String? name,
    String? artistString,
    String? imageUrl,
    String? songType,
    String? pvServices,
    String? additionalNames,
    String? createDate,
    int? favoritedTimes,
    int? lengthSeconds,
    String? publishDate,
    int? ratingScore,
    List<TagUsage>? tagUsages,
    List<ArtistRole>? artistRoles,
    List<Album>? albums,
    List<Lyric>? lyrics,
    List<PV>? pvs,
    List<WebLink>? webLinks,
  }) {
    return Song(
      id: id ?? this.id,
      name: name ?? this.name,
      artistString: artistString ?? this.artistString,
      imageUrl: imageUrl ?? this.imageUrl,
      songType: songType ?? this.songType,
      pvServices: pvServices ?? this.pvServices,
      additionalNames: additionalNames ?? this.additionalNames,
      createDate: createDate ?? this.createDate,
      favoritedTimes: favoritedTimes ?? this.favoritedTimes,
      lengthSeconds: lengthSeconds ?? this.lengthSeconds,
      publishDate: publishDate ?? this.publishDate,
      ratingScore: ratingScore ?? this.ratingScore,
      tagUsages: tagUsages ?? this.tagUsages,
      artistRoles: artistRoles ?? this.artistRoles,
      albums: albums ?? this.albums,
      lyrics: lyrics ?? this.lyrics,
      pvs: pvs ?? this.pvs,
      webLinks: webLinks ?? this.webLinks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'artistString': artistString,
      'imageUrl': imageUrl,
      'songType': songType,
      'pvServices': pvServices,
      'additionalNames': additionalNames,
      'createDate': createDate,
      'favoritedTimes': favoritedTimes,
      'lengthSeconds': lengthSeconds,
      'publishDate': publishDate,
      'ratingScore': ratingScore,
      'tagUsages': tagUsages?.map((x) => x.toMap()).toList(),
      'artistRoles': artistRoles?.map((x) => x.toMap()).toList(),
      'albums': albums?.map((x) => x.toMap()).toList(),
      'lyrics': lyrics?.map((x) => x.toMap()).toList(),
      'pvs': pvs?.map((x) => x.toMap()).toList(),
      'webLinks': webLinks?.map((x) => x.toMap()).toList(),
    };
  }

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      artistString:
          map['artistString'] != null ? map['artistString'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      songType: map['songType'] != null ? map['songType'] as String : null,
      pvServices:
          map['pvServices'] != null ? map['pvServices'] as String : null,
      additionalNames: map['additionalNames'] != null
          ? map['additionalNames'] as String
          : null,
      createDate:
          map['createDate'] != null ? map['createDate'] as String : null,
      favoritedTimes:
          map['favoritedTimes'] != null ? map['favoritedTimes'] as int : null,
      lengthSeconds:
          map['lengthSeconds'] != null ? map['lengthSeconds'] as int : null,
      publishDate:
          map['publishDate'] != null ? map['publishDate'] as String : null,
      ratingScore:
          map['ratingScore'] != null ? map['ratingScore'] as int : null,
      tagUsages: map['tagUsages'] != null
          ? List<TagUsage>.from(
              (map['tagUsages'] as List<int>).map<TagUsage?>(
                (x) => TagUsage.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      artistRoles: map['artistRoles'] != null
          ? List<ArtistRole>.from(
              (map['artistRoles'] as List<int>).map<ArtistRole?>(
                (x) => ArtistRole.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      albums: map['albums'] != null
          ? List<Album>.from(
              (map['albums'] as List<int>).map<Album?>(
                (x) => Album.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      lyrics: map['lyrics'] != null
          ? List<Lyric>.from(
              (map['lyrics'] as List<int>).map<Lyric?>(
                (x) => Lyric.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      pvs: map['pvs'] != null
          ? List<PV>.from(
              (map['pvs'] as List<int>).map<PV?>(
                (x) => PV.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      webLinks: map['webLinks'] != null
          ? List<WebLink>.from(
              (map['webLinks'] as List<int>).map<WebLink?>(
                (x) => WebLink.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Song.fromJson(String source) =>
      Song.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Song(id: $id, name: $name, artistString: $artistString, imageUrl: $imageUrl, songType: $songType, pvServices: $pvServices, additionalNames: $additionalNames, createDate: $createDate, favoritedTimes: $favoritedTimes, lengthSeconds: $lengthSeconds, publishDate: $publishDate, ratingScore: $ratingScore, tagUsages: $tagUsages, artistRoles: $artistRoles, albums: $albums, lyrics: $lyrics, pvs: $pvs, webLinks: $webLinks)';
  }

  @override
  bool operator ==(covariant Song other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.artistString == artistString &&
        other.imageUrl == imageUrl &&
        other.songType == songType &&
        other.pvServices == pvServices &&
        other.additionalNames == additionalNames &&
        other.createDate == createDate &&
        other.favoritedTimes == favoritedTimes &&
        other.lengthSeconds == lengthSeconds &&
        other.publishDate == publishDate &&
        other.ratingScore == ratingScore &&
        listEquals(other.tagUsages, tagUsages) &&
        listEquals(other.artistRoles, artistRoles) &&
        listEquals(other.albums, albums) &&
        listEquals(other.lyrics, lyrics) &&
        listEquals(other.pvs, pvs) &&
        listEquals(other.webLinks, webLinks);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        artistString.hashCode ^
        imageUrl.hashCode ^
        songType.hashCode ^
        pvServices.hashCode ^
        additionalNames.hashCode ^
        createDate.hashCode ^
        favoritedTimes.hashCode ^
        lengthSeconds.hashCode ^
        publishDate.hashCode ^
        ratingScore.hashCode ^
        tagUsages.hashCode ^
        artistRoles.hashCode ^
        albums.hashCode ^
        lyrics.hashCode ^
        pvs.hashCode ^
        webLinks.hashCode;
  }
}

extension SongPV on Song {
  String get pvSearchQuery =>
      (pvs!.isNotEmpty) ? pvs![0].name : '$artistString+$name';
}
