// ignore_for_file: public_member_api_docs, sort_constructors_first
// TODO : need implementation
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:vocadb_app/src/constants/config.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';

import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

enum EntryType {
  Undefined,
  Song,
  Artist,
  Album,
  ReleaseEvent,
  Tag,
  ReleaseEventSeries
}

class Entry {
  int id;
  String entryType;
  String? additionalNames;
  String? defaultName;
  String name;
  String? artistString;
  String? artistType;
  String? songType;
  String? discType;
  String? eventCategory;
  String? activityDate;
  MainPicture? mainPicture;
  List<TagUsage>? tags;
  List<WebLink>? webLinks;

  Entry({
    required this.id,
    required this.entryType,
    this.additionalNames,
    this.defaultName,
    required this.name,
    this.artistString,
    this.artistType,
    this.songType,
    this.discType,
    this.eventCategory,
    this.activityDate,
    this.mainPicture,
    this.tags,
    this.webLinks,
  });

  Entry copyWith({
    int? id,
    String? entryType,
    String? additionalNames,
    String? defaultName,
    String? name,
    String? artistString,
    String? artistType,
    String? songType,
    String? discType,
    String? eventCategory,
    String? activityDate,
    MainPicture? mainPicture,
    List<TagUsage>? tags,
    List<WebLink>? webLinks,
  }) {
    return Entry(
      id: id ?? this.id,
      entryType: entryType ?? this.entryType,
      additionalNames: additionalNames ?? this.additionalNames,
      defaultName: defaultName ?? this.defaultName,
      name: name ?? this.name,
      artistString: artistString ?? this.artistString,
      artistType: artistType ?? this.artistType,
      songType: songType ?? this.songType,
      discType: discType ?? this.discType,
      eventCategory: eventCategory ?? this.eventCategory,
      activityDate: activityDate ?? this.activityDate,
      mainPicture: mainPicture ?? this.mainPicture,
      tags: tags ?? this.tags,
      webLinks: webLinks ?? this.webLinks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'entryType': entryType,
      'additionalNames': additionalNames,
      'defaultName': defaultName,
      'name': name,
      'artistString': artistString,
      'artistType': artistType,
      'songType': songType,
      'discType': discType,
      'eventCategory': eventCategory,
      'activityDate': activityDate,
      'mainPicture': mainPicture?.toMap(),
      'tags': tags?.map((x) => x.toMap()).toList(),
      'webLinks': webLinks?.map((x) => x.toMap()).toList(),
    };
  }

  factory Entry.fromMap(Map<String, dynamic> map) {
    return Entry(
      id: map['id'] as int,
      entryType: map['entryType'] as String,
      additionalNames: map['additionalNames'] != null
          ? map['additionalNames'] as String
          : null,
      defaultName:
          map['defaultName'] != null ? map['defaultName'] as String : null,
      name: map['name'] as String,
      artistString:
          map['artistString'] != null ? map['artistString'] as String : null,
      artistType:
          map['artistType'] != null ? map['artistType'] as String : null,
      songType: map['songType'] != null ? map['songType'] as String : null,
      discType: map['discType'] != null ? map['discType'] as String : null,
      eventCategory:
          map['eventCategory'] != null ? map['eventCategory'] as String : null,
      activityDate:
          map['activityDate'] != null ? map['activityDate'] as String : null,
      mainPicture: map['mainPicture'] != null
          ? MainPicture.fromMap(map['mainPicture'] as Map<String, dynamic>)
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

  factory Entry.fromJson(String source) =>
      Entry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Entry(id: $id, entryType: $entryType, additionalNames: $additionalNames, defaultName: $defaultName, name: $name, artistString: $artistString, artistType: $artistType, songType: $songType, discType: $discType, eventCategory: $eventCategory, activityDate: $activityDate, mainPicture: $mainPicture, tags: $tags, webLinks: $webLinks)';
  }

  @override
  bool operator ==(covariant Entry other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.entryType == entryType &&
        other.additionalNames == additionalNames &&
        other.defaultName == defaultName &&
        other.name == name &&
        other.artistString == artistString &&
        other.artistType == artistType &&
        other.songType == songType &&
        other.discType == discType &&
        other.eventCategory == eventCategory &&
        other.activityDate == activityDate &&
        other.mainPicture == mainPicture &&
        listEquals(other.tags, tags) &&
        listEquals(other.webLinks, webLinks);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        entryType.hashCode ^
        additionalNames.hashCode ^
        defaultName.hashCode ^
        name.hashCode ^
        artistString.hashCode ^
        artistType.hashCode ^
        songType.hashCode ^
        discType.hashCode ^
        eventCategory.hashCode ^
        activityDate.hashCode ^
        mainPicture.hashCode ^
        tags.hashCode ^
        webLinks.hashCode;
  }
}

extension EntryMapper on Entry {
  Song toSong() {
    return Song(
      id: id.toString(),
      imageUrl: mainPicture?.urlThumb ?? kPlaceholderImageUrl,
      name: name,
      artistString: artistString ?? 'None',
      songType: songType ?? 'None',
    );
  }

  Artist toArtist() {
    return Artist(
      id: id,
      name: name,
      imageUrl: mainPicture?.urlThumb ?? kPlaceholderImageUrl,
      artistType: artistType ?? 'None',
    );
  }

  Album toAlbum() {
    return Album(
      id: id.toString(),
      name: name,
      imageUrl: mainPicture?.urlThumb ?? kPlaceholderImageUrl,
      discType: discType ?? 'None',
      artistString: artistString ?? 'None',
    );
  }

  ReleaseEvent toReleaseEvent() {
    return ReleaseEvent(
      id: id.toString(),
      name: name,
      imageUrl: mainPicture?.urlThumb ?? kPlaceholderImageUrl,
    );
  }
}

extension EntryList on List<Entry> {
  List<Entry> get songEntries =>
      where((e) => EntryType.Song == EntryType.values.byName(e.entryType))
          .toList();

  List<Entry> get artistEntries =>
      where((e) => EntryType.Artist == EntryType.values.byName(e.entryType))
          .toList();

  List<Entry> get albumEntries =>
      where((e) => EntryType.Album == EntryType.values.byName(e.entryType))
          .toList();

  List<Entry> get releaseEventEntries => where(
          (e) => EntryType.ReleaseEvent == EntryType.values.byName(e.entryType))
      .toList();
}
