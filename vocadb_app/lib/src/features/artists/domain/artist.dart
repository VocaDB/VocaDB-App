// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'package:vocadb_app/src/features/artists/domain/artist_link.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_relations.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

class Artist {
  final int id;

  final String? name;

  final String? additionalNames;

  final String? releaseDate;

  final String? imageUrl;

  final String? artistType;

  final String? description;

  final MainPicture? mainPicture;

  final ArtistRelations? relations;

  final Artist? baseVoicebank;

  final List<TagUsage>? tags;

  final List<WebLink>? webLinks;

  final List<ArtistLink>? artistLinksReverse;

  final List<ArtistLink>? artistLinks;

  Artist({
    required this.id,
    this.name,
    this.additionalNames,
    this.releaseDate,
    this.imageUrl,
    this.artistType,
    this.description,
    this.mainPicture,
    this.relations,
    this.baseVoicebank,
    this.tags = const [],
    this.webLinks = const [],
    this.artistLinksReverse = const [],
    this.artistLinks = const [],
  });

  Artist copyWith({
    int? id,
    String? name,
    String? additionalNames,
    String? releaseDate,
    String? imageUrl,
    String? artistType,
    String? description,
    MainPicture? mainPicture,
    ArtistRelations? relations,
    Artist? baseVoicebank,
    List<TagUsage>? tags,
    List<WebLink>? webLinks,
    List<ArtistLink>? artistLinksReverse,
    List<ArtistLink>? artistLinks,
  }) {
    return Artist(
      id: id ?? this.id,
      name: name ?? this.name,
      additionalNames: additionalNames ?? this.additionalNames,
      releaseDate: releaseDate ?? this.releaseDate,
      imageUrl: imageUrl ?? this.imageUrl,
      artistType: artistType ?? this.artistType,
      description: description ?? this.description,
      mainPicture: mainPicture ?? this.mainPicture,
      relations: relations ?? this.relations,
      baseVoicebank: baseVoicebank ?? this.baseVoicebank,
      tags: tags ?? this.tags,
      webLinks: webLinks ?? this.webLinks,
      artistLinksReverse: artistLinksReverse ?? this.artistLinksReverse,
      artistLinks: artistLinks ?? this.artistLinks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'additionalNames': additionalNames,
      'releaseDate': releaseDate,
      'imageUrl': imageUrl,
      'artistType': artistType,
      'description': description,
      'mainPicture': mainPicture?.toMap(),
      'relations': relations?.toMap(),
      'baseVoicebank': baseVoicebank?.toMap(),
      'tags': tags?.map((x) => x.toMap()).toList(),
      'webLinks': webLinks?.map((x) => x.toMap()).toList(),
      'artistLinksReverse': artistLinksReverse?.map((x) => x.toMap()).toList(),
      'artistLinks': artistLinks?.map((x) => x.toMap()).toList(),
    };
  }

  factory Artist.fromMap(Map<String, dynamic> map) {
    return Artist(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      additionalNames: map['additionalNames'] != null
          ? map['additionalNames'] as String
          : null,
      releaseDate:
          map['releaseDate'] != null ? map['releaseDate'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      artistType:
          map['artistType'] != null ? map['artistType'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      mainPicture: map['mainPicture'] != null
          ? MainPicture.fromMap(map['mainPicture'] as Map<String, dynamic>)
          : null,
      relations: map['relations'] != null
          ? ArtistRelations.fromMap(map['relations'] as Map<String, dynamic>)
          : null,
      baseVoicebank: map['baseVoicebank'] != null
          ? Artist.fromMap(map['baseVoicebank'] as Map<String, dynamic>)
          : null,
      tags: map['tags'] != null
          ? List<TagUsage>.from(
              (map['tags'] as List<int>).map<TagUsage?>(
                (x) => TagUsage.fromMap(x as Map<String, dynamic>),
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
      artistLinksReverse: map['artistLinksReverse'] != null
          ? List<ArtistLink>.from(
              (map['artistLinksReverse'] as List<int>).map<ArtistLink?>(
                (x) => ArtistLink.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      artistLinks: map['artistLinks'] != null
          ? List<ArtistLink>.from(
              (map['artistLinks'] as List<int>).map<ArtistLink?>(
                (x) => ArtistLink.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Artist.fromJson(String source) =>
      Artist.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Artist(id: $id, name: $name, additionalNames: $additionalNames, releaseDate: $releaseDate, imageUrl: $imageUrl, artistType: $artistType, description: $description, mainPicture: $mainPicture, relations: $relations, baseVoicebank: $baseVoicebank, tags: $tags, webLinks: $webLinks, artistLinksReverse: $artistLinksReverse, artistLinks: $artistLinks)';
  }

  @override
  bool operator ==(covariant Artist other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.additionalNames == additionalNames &&
        other.releaseDate == releaseDate &&
        other.imageUrl == imageUrl &&
        other.artistType == artistType &&
        other.description == description &&
        other.mainPicture == mainPicture &&
        other.relations == relations &&
        other.baseVoicebank == baseVoicebank &&
        listEquals(other.tags, tags) &&
        listEquals(other.webLinks, webLinks) &&
        listEquals(other.artistLinksReverse, artistLinksReverse) &&
        listEquals(other.artistLinks, artistLinks);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        additionalNames.hashCode ^
        releaseDate.hashCode ^
        imageUrl.hashCode ^
        artistType.hashCode ^
        description.hashCode ^
        mainPicture.hashCode ^
        relations.hashCode ^
        baseVoicebank.hashCode ^
        tags.hashCode ^
        webLinks.hashCode ^
        artistLinksReverse.hashCode ^
        artistLinks.hashCode;
  }
}

extension ArtistDateFormat on Artist {
  String? get releaseDateFormatted => (releaseDate == null)
      ? null
      : DateFormat('yyyy-MM-dd').format(DateTime.parse(releaseDate!));
}
