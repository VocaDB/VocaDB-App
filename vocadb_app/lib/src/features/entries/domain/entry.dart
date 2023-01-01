// ignore_for_file: public_member_api_docs, sort_constructors_first
// TODO : need implementation

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
}

extension EntryMapper on Entry {
  Song toSong() {
    return Song(
      id: id,
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
      id: id,
      name: name,
      imageUrl: mainPicture?.urlThumb ?? kPlaceholderImageUrl,
      discType: discType ?? 'None',
      artistString: artistString ?? 'None',
    );
  }

  ReleaseEvent toReleaseEvent() {
    return ReleaseEvent(
      id: id,
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
