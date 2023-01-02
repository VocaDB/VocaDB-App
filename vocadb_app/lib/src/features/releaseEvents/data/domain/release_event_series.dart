// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/domain/release_event.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

class ReleaseEventSeries {
  final int id;

  final String? name;

  final String? additionalNames;

  final String? description;

  final String? category;

  final List<ReleaseEvent>? events;

  final MainPicture? mainPicture;

  final List<WebLink>? webLinks;
  ReleaseEventSeries({
    required this.id,
    this.name,
    this.additionalNames,
    this.description,
    this.category,
    this.events,
    this.mainPicture,
    this.webLinks,
  });

  ReleaseEventSeries copyWith({
    int? id,
    String? name,
    String? additionalNames,
    String? description,
    String? category,
    List<ReleaseEvent>? events,
    MainPicture? mainPicture,
    List<WebLink>? webLinks,
  }) {
    return ReleaseEventSeries(
      id: id ?? this.id,
      name: name ?? this.name,
      additionalNames: additionalNames ?? this.additionalNames,
      description: description ?? this.description,
      category: category ?? this.category,
      events: events ?? this.events,
      mainPicture: mainPicture ?? this.mainPicture,
      webLinks: webLinks ?? this.webLinks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'additionalNames': additionalNames,
      'description': description,
      'category': category,
      'events': events?.map((x) => x.toMap()).toList(),
      'mainPicture': mainPicture?.toMap(),
      'webLinks': webLinks?.map((x) => x.toMap()).toList(),
    };
  }

  factory ReleaseEventSeries.fromMap(Map<String, dynamic> map) {
    return ReleaseEventSeries(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      additionalNames: map['additionalNames'] != null
          ? map['additionalNames'] as String
          : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      events: map['events'] != null
          ? List<ReleaseEvent>.from(
              (map['events'] as List<int>).map<ReleaseEvent?>(
                (x) => ReleaseEvent.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      mainPicture: map['mainPicture'] != null
          ? MainPicture.fromMap(map['mainPicture'] as Map<String, dynamic>)
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

  factory ReleaseEventSeries.fromJson(String source) =>
      ReleaseEventSeries.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReleaseEventSeries(id: $id, name: $name, additionalNames: $additionalNames, description: $description, category: $category, events: $events, mainPicture: $mainPicture, webLinks: $webLinks)';
  }

  @override
  bool operator ==(covariant ReleaseEventSeries other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.additionalNames == additionalNames &&
        other.description == description &&
        other.category == category &&
        listEquals(other.events, events) &&
        other.mainPicture == mainPicture &&
        listEquals(other.webLinks, webLinks);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        additionalNames.hashCode ^
        description.hashCode ^
        category.hashCode ^
        events.hashCode ^
        mainPicture.hashCode ^
        webLinks.hashCode;
  }
}
