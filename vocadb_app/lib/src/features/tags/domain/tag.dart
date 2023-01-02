// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

class Tag {
  final int id;

  final String? name;

  final String? categoryName;

  final String? description;

  final MainPicture? mainPicture;

  final Tag? parent;

  final List<Tag>? relatedTags;

  final int? usageCount;

  final List<WebLink>? webLinks;

  final String? additionalNames;

  Tag({
    required this.id,
    this.name,
    this.categoryName,
    this.description,
    this.mainPicture,
    this.parent,
    this.relatedTags,
    this.usageCount,
    this.webLinks,
    this.additionalNames,
  });

  Tag copyWith({
    int? id,
    String? name,
    String? categoryName,
    String? description,
    MainPicture? mainPicture,
    Tag? parent,
    List<Tag>? relatedTags,
    int? usageCount,
    List<WebLink>? webLinks,
    String? additionalNames,
  }) {
    return Tag(
      id: id ?? this.id,
      name: name ?? this.name,
      categoryName: categoryName ?? this.categoryName,
      description: description ?? this.description,
      mainPicture: mainPicture ?? this.mainPicture,
      parent: parent ?? this.parent,
      relatedTags: relatedTags ?? this.relatedTags,
      usageCount: usageCount ?? this.usageCount,
      webLinks: webLinks ?? this.webLinks,
      additionalNames: additionalNames ?? this.additionalNames,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'categoryName': categoryName,
      'description': description,
      'mainPicture': mainPicture?.toMap(),
      'parent': parent?.toMap(),
      'relatedTags': relatedTags?.map((x) => x.toMap()).toList(),
      'usageCount': usageCount,
      'webLinks': webLinks?.map((x) => x.toMap()).toList(),
      'additionalNames': additionalNames,
    };
  }

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      categoryName:
          map['categoryName'] != null ? map['categoryName'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      mainPicture: map['mainPicture'] != null
          ? MainPicture.fromMap(map['mainPicture'] as Map<String, dynamic>)
          : null,
      parent: map['parent'] != null
          ? Tag.fromMap(map['parent'] as Map<String, dynamic>)
          : null,
      relatedTags: map['relatedTags'] != null
          ? List<Tag>.from(
              (map['relatedTags'] as List<int>).map<Tag?>(
                (x) => Tag.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      usageCount: map['usageCount'] != null ? map['usageCount'] as int : null,
      webLinks: map['webLinks'] != null
          ? List<WebLink>.from(
              (map['webLinks'] as List<int>).map<WebLink?>(
                (x) => WebLink.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      additionalNames: map['additionalNames'] != null
          ? map['additionalNames'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tag.fromJson(String source) =>
      Tag.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Tag(id: $id, name: $name, categoryName: $categoryName, description: $description, mainPicture: $mainPicture, parent: $parent, relatedTags: $relatedTags, usageCount: $usageCount, webLinks: $webLinks, additionalNames: $additionalNames)';
  }

  @override
  bool operator ==(covariant Tag other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.categoryName == categoryName &&
        other.description == description &&
        other.mainPicture == mainPicture &&
        other.parent == parent &&
        listEquals(other.relatedTags, relatedTags) &&
        other.usageCount == usageCount &&
        listEquals(other.webLinks, webLinks) &&
        other.additionalNames == additionalNames;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        categoryName.hashCode ^
        description.hashCode ^
        mainPicture.hashCode ^
        parent.hashCode ^
        relatedTags.hashCode ^
        usageCount.hashCode ^
        webLinks.hashCode ^
        additionalNames.hashCode;
  }
}
