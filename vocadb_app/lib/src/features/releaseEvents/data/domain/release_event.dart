// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/domain/release_event_series.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

class ReleaseEvent {
  final int id;

  final String? name;

  final String? additionalNames;

  final String? description;

  final DateTime? date;

  final DateTime? endDate;

  final String? imageUrl;

  final String? category;

  final String? venueName;

  final MainPicture? mainPicture;

  final List<ArtistRole>? artists;

  final ReleaseEventSeries? series;

  final List<TagUsage>? tags;

  final List<WebLink>? webLinks;

  ReleaseEvent({
    required this.id,
    this.name,
    this.additionalNames,
    this.description,
    this.date,
    this.endDate,
    this.imageUrl,
    this.category,
    this.venueName,
    this.mainPicture,
    this.artists,
    this.series,
    this.tags,
    this.webLinks,
  });

  ReleaseEvent copyWith({
    int? id,
    String? name,
    String? additionalNames,
    String? description,
    DateTime? date,
    DateTime? endDate,
    String? imageUrl,
    String? category,
    String? venueName,
    MainPicture? mainPicture,
    List<ArtistRole>? artists,
    ReleaseEventSeries? series,
    List<TagUsage>? tags,
    List<WebLink>? webLinks,
  }) {
    return ReleaseEvent(
      id: id ?? this.id,
      name: name ?? this.name,
      additionalNames: additionalNames ?? this.additionalNames,
      description: description ?? this.description,
      date: date ?? this.date,
      endDate: endDate ?? this.endDate,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      venueName: venueName ?? this.venueName,
      mainPicture: mainPicture ?? this.mainPicture,
      artists: artists ?? this.artists,
      series: series ?? this.series,
      tags: tags ?? this.tags,
      webLinks: webLinks ?? this.webLinks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'additionalNames': additionalNames,
      'description': description,
      'date': date?.millisecondsSinceEpoch,
      'endDate': endDate?.millisecondsSinceEpoch,
      'imageUrl': imageUrl,
      'category': category,
      'venueName': venueName,
      'mainPicture': mainPicture?.toMap(),
      'artists': artists?.map((x) => x.toMap()).toList(),
      'series': series?.toMap(),
      'tags': tags?.map((x) => x.toMap()).toList(),
      'webLinks': webLinks?.map((x) => x.toMap()).toList(),
    };
  }

  factory ReleaseEvent.fromMap(Map<String, dynamic> map) {
    return ReleaseEvent(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      additionalNames: map['additionalNames'] != null
          ? map['additionalNames'] as String
          : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int)
          : null,
      endDate: map['endDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['endDate'] as int)
          : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      venueName: map['venueName'] != null ? map['venueName'] as String : null,
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
      series: map['series'] != null
          ? ReleaseEventSeries.fromMap(map['series'] as Map<String, dynamic>)
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
    );
  }

  String toJson() => json.encode(toMap());

  factory ReleaseEvent.fromJson(String source) =>
      ReleaseEvent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReleaseEvent(id: $id, name: $name, additionalNames: $additionalNames, description: $description, date: $date, endDate: $endDate, imageUrl: $imageUrl, category: $category, venueName: $venueName, mainPicture: $mainPicture, artists: $artists, series: $series, tags: $tags, webLinks: $webLinks)';
  }

  @override
  bool operator ==(covariant ReleaseEvent other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.additionalNames == additionalNames &&
        other.description == description &&
        other.date == date &&
        other.endDate == endDate &&
        other.imageUrl == imageUrl &&
        other.category == category &&
        other.venueName == venueName &&
        other.mainPicture == mainPicture &&
        listEquals(other.artists, artists) &&
        other.series == series &&
        listEquals(other.tags, tags) &&
        listEquals(other.webLinks, webLinks);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        additionalNames.hashCode ^
        description.hashCode ^
        date.hashCode ^
        endDate.hashCode ^
        imageUrl.hashCode ^
        category.hashCode ^
        venueName.hashCode ^
        mainPicture.hashCode ^
        artists.hashCode ^
        series.hashCode ^
        tags.hashCode ^
        webLinks.hashCode;
  }
}

extension ReleaseEventExtended on ReleaseEvent {
  String? get displayCategory {
    return series?.category ?? category ?? '<None>';
  }

  String? get dateFormatted =>
      (date == null) ? null : DateFormat('yyyy-MM-dd').format(date!);
}
