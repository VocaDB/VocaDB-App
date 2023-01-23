// ignore_for_file: public_member_api_docs, sort_constructors_first
// TODO : need implementation

import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';

import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry.freezed.dart';
part 'entry.g.dart';

enum EntryType {
  Undefined,
  Song,
  Artist,
  Album,
  ReleaseEvent,
  Tag,
  ReleaseEventSeries
}

@freezed
class Entry with _$Entry {
  factory Entry({
    required int id,
    required String entryType,
    String? additionalNames,
    String? defaultName,
    String? name,
    String? artistString,
    String? artistType,
    String? songType,
    String? discType,
    String? eventCategory,
    DateTime? activityDate,
    MainPicture? mainPicture,
    @Default([]) List<TagUsage> tags,
    @Default([]) List<WebLink> webLinks,
  }) = _Entry;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  static List<Entry> fromJsonToList(List<dynamic> source) {
    return source.map((e) => Entry.fromJson(e)).toList();
  }
}

extension EntryMapper on Entry {
  Song toSong() {
    return Song(
      id: id,
      mainPicture: mainPicture,
      name: name,
      artistString: artistString ?? 'None',
      songType: songType ?? 'None',
    );
  }

  Artist toArtist() {
    return Artist(
      id: id,
      name: name,
      mainPicture: mainPicture,
      artistType: artistType ?? 'None',
    );
  }

  Album toAlbum() {
    return Album(
      id: id,
      name: name,
      mainPicture: mainPicture,
      discType: discType ?? 'None',
      artistString: artistString ?? 'None',
    );
  }

  ReleaseEvent toReleaseEvent() {
    return ReleaseEvent(
      id: id,
      name: name,
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
