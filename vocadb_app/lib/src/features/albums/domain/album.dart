// ignore_for_file: public_member_api_docs, sort_constructors_first
// TODO : need more implementation detail
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:vocadb_app/src/features/albums/domain/track.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/pvs/domain/pv.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

class Album {
  final int id;

  final String? name;

  final String? artistString;

  final String? imageUrl;

  final String? discType;

  final String? catalogNumber;

  final String? description;

  final List<Disc>? discs;

  final MainPicture? mainPicture;

  final List<ArtistRole>? artists;

  final List<PV>? pvs;

  final double? ratingAverage;

  final int? ratingCount;

  final ReleaseDate? releaseDate;

  final List<TagUsage>? tags;

  final List<Track>? tracks;

  final List<WebLink>? webLinks;
  Album({
    required this.id,
    this.name,
    this.artistString,
    this.imageUrl,
    this.discType,
    this.catalogNumber,
    this.description,
    this.discs,
    this.mainPicture,
    this.artists,
    this.pvs,
    this.ratingAverage,
    this.ratingCount,
    this.releaseDate,
    this.tags,
    this.tracks,
    this.webLinks,
  });

  Album copyWith({
    int? id,
    String? name,
    String? artistString,
    String? imageUrl,
    String? discType,
    String? catalogNumber,
    String? description,
    List<Disc>? discs,
    MainPicture? mainPicture,
    List<ArtistRole>? artists,
    List<PV>? pvs,
    double? ratingAverage,
    int? ratingCount,
    ReleaseDate? releaseDate,
    List<TagUsage>? tags,
    List<Track>? tracks,
    List<WebLink>? webLinks,
  }) {
    return Album(
      id: id ?? this.id,
      name: name ?? this.name,
      artistString: artistString ?? this.artistString,
      imageUrl: imageUrl ?? this.imageUrl,
      discType: discType ?? this.discType,
      catalogNumber: catalogNumber ?? this.catalogNumber,
      description: description ?? this.description,
      discs: discs ?? this.discs,
      mainPicture: mainPicture ?? this.mainPicture,
      artists: artists ?? this.artists,
      pvs: pvs ?? this.pvs,
      ratingAverage: ratingAverage ?? this.ratingAverage,
      ratingCount: ratingCount ?? this.ratingCount,
      releaseDate: releaseDate ?? this.releaseDate,
      tags: tags ?? this.tags,
      tracks: tracks ?? this.tracks,
      webLinks: webLinks ?? this.webLinks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'artistString': artistString,
      'imageUrl': imageUrl,
      'discType': discType,
      'catalogNumber': catalogNumber,
      'description': description,
      'discs': discs?.map((x) => x.toMap()).toList(),
      'mainPicture': mainPicture?.toMap(),
      'artists': artists?.map((x) => x.toMap()).toList(),
      'pvs': pvs?.map((x) => x.toMap()).toList(),
      'ratingAverage': ratingAverage,
      'ratingCount': ratingCount,
      'releaseDate': releaseDate?.toMap(),
      'tags': tags?.map((x) => x.toMap()).toList(),
      'tracks': tracks?.map((x) => x.toMap()).toList(),
      'webLinks': webLinks?.map((x) => x.toMap()).toList(),
    };
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      artistString:
          map['artistString'] != null ? map['artistString'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      discType: map['discType'] != null ? map['discType'] as String : null,
      catalogNumber:
          map['catalogNumber'] != null ? map['catalogNumber'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      discs: map['discs'] != null
          ? List<Disc>.from(
              (map['discs'] as List<int>).map<Disc?>(
                (x) => Disc.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      mainPicture: map['mainPicture'] != null
          ? MainPicture.fromMap(map['mainPicture'] as Map<String, dynamic>)
          : null,
      artists: map['artists'] != null
          ? List<ArtistRole>.from(
              (map['artists'] as List<int>).map<ArtistRole?>(
                (x) => ArtistRole.fromMap(x as Map<String, dynamic>),
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
      ratingAverage:
          map['ratingAverage'] != null ? map['ratingAverage'] as double : null,
      ratingCount:
          map['ratingCount'] != null ? map['ratingCount'] as int : null,
      releaseDate: map['releaseDate'] != null
          ? ReleaseDate.fromMap(map['releaseDate'] as Map<String, dynamic>)
          : null,
      tags: map['tags'] != null
          ? List<TagUsage>.from(
              (map['tags'] as List<int>).map<TagUsage?>(
                (x) => TagUsage.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      tracks: map['tracks'] != null
          ? List<Track>.from(
              (map['tracks'] as List<int>).map<Track?>(
                (x) => Track.fromMap(x as Map<String, dynamic>),
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

  factory Album.fromJson(String source) =>
      Album.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Album(id: $id, name: $name, artistString: $artistString, imageUrl: $imageUrl, discType: $discType, catalogNumber: $catalogNumber, description: $description, discs: $discs, mainPicture: $mainPicture, artists: $artists, pvs: $pvs, ratingAverage: $ratingAverage, ratingCount: $ratingCount, releaseDate: $releaseDate, tags: $tags, tracks: $tracks, webLinks: $webLinks)';
  }

  @override
  bool operator ==(covariant Album other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.artistString == artistString &&
        other.imageUrl == imageUrl &&
        other.discType == discType &&
        other.catalogNumber == catalogNumber &&
        other.description == description &&
        listEquals(other.discs, discs) &&
        other.mainPicture == mainPicture &&
        listEquals(other.artists, artists) &&
        listEquals(other.pvs, pvs) &&
        other.ratingAverage == ratingAverage &&
        other.ratingCount == ratingCount &&
        other.releaseDate == releaseDate &&
        listEquals(other.tags, tags) &&
        listEquals(other.tracks, tracks) &&
        listEquals(other.webLinks, webLinks);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        artistString.hashCode ^
        imageUrl.hashCode ^
        discType.hashCode ^
        catalogNumber.hashCode ^
        description.hashCode ^
        discs.hashCode ^
        mainPicture.hashCode ^
        artists.hashCode ^
        pvs.hashCode ^
        ratingAverage.hashCode ^
        ratingCount.hashCode ^
        releaseDate.hashCode ^
        tags.hashCode ^
        tracks.hashCode ^
        webLinks.hashCode;
  }
}

class ReleaseDate {
  final int day;
  final String formatted;
  final int month;
  final int year;
  ReleaseDate({
    required this.day,
    required this.formatted,
    required this.month,
    required this.year,
  });

  ReleaseDate copyWith({
    int? day,
    String? formatted,
    int? month,
    int? year,
  }) {
    return ReleaseDate(
      day: day ?? this.day,
      formatted: formatted ?? this.formatted,
      month: month ?? this.month,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'formatted': formatted,
      'month': month,
      'year': year,
    };
  }

  factory ReleaseDate.fromMap(Map<String, dynamic> map) {
    return ReleaseDate(
      day: map['day'] as int,
      formatted: map['formatted'] as String,
      month: map['month'] as int,
      year: map['year'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReleaseDate.fromJson(String source) =>
      ReleaseDate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReleaseDate(day: $day, formatted: $formatted, month: $month, year: $year)';
  }

  @override
  bool operator ==(covariant ReleaseDate other) {
    if (identical(this, other)) return true;

    return other.day == day &&
        other.formatted == formatted &&
        other.month == month &&
        other.year == year;
  }

  @override
  int get hashCode {
    return day.hashCode ^ formatted.hashCode ^ month.hashCode ^ year.hashCode;
  }
}

class Disc {
  final int id;
  final int discNumber;
  final String mediaType;
  final String name;
  Disc({
    required this.id,
    required this.discNumber,
    required this.mediaType,
    required this.name,
  });

  Disc copyWith({
    int? id,
    int? discNumber,
    String? mediaType,
    String? name,
  }) {
    return Disc(
      id: id ?? this.id,
      discNumber: discNumber ?? this.discNumber,
      mediaType: mediaType ?? this.mediaType,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'discNumber': discNumber,
      'mediaType': mediaType,
      'name': name,
    };
  }

  factory Disc.fromMap(Map<String, dynamic> map) {
    return Disc(
      id: map['id'] as int,
      discNumber: map['discNumber'] as int,
      mediaType: map['mediaType'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Disc.fromJson(String source) =>
      Disc.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Disc(id: $id, discNumber: $discNumber, mediaType: $mediaType, name: $name)';
  }

  @override
  bool operator ==(covariant Disc other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.discNumber == discNumber &&
        other.mediaType == mediaType &&
        other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        discNumber.hashCode ^
        mediaType.hashCode ^
        name.hashCode;
  }
}
