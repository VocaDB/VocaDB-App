import 'package:intl/intl.dart';
import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/models.dart';

class EntryModel extends BaseModel {
  int id;
  EntryType entryType;
  String additionalNames;
  String defaultName;
  String name;
  String artistString;
  String artistType;
  String songType;
  String discType;
  String eventCategory;
  String activityDate;
  MainPictureModel mainPicture;
  List<TagGroupModel> tagGroups;
  List<WebLinkModel> webLinks;

  EntryModel(
      {this.id,
      this.entryType,
      this.additionalNames,
      this.defaultName,
      this.name,
      this.artistString,
      this.artistType,
      this.songType,
      this.discType,
      this.eventCategory,
      this.activityDate,
      this.mainPicture,
      this.tagGroups,
      this.webLinks});

  EntryModel.fromJson(Map<String, dynamic> json, {EntryType entryType})
      : id = json['id'],
        name = json['name'],
        songType = json['songType'],
        discType = json['discType'],
        eventCategory = json['eventCategory'],
        activityDate = json['activityDate'],
        additionalNames = json['additionalNames'] ?? '',
        defaultName = json['defaultName'],
        entryType = (entryType != null)
            ? entryType
            : entryTypeToEnum(json['entryType']),
        artistString = json['artistString'],
        artistType = json['artistType'],
        mainPicture = json.containsKey('mainPicture')
            ? MainPictureModel.fromJson(json['mainPicture'] ?? {})
            : null,
        tagGroups = (json.containsKey('tags'))
            ? (json['tags'] as List)
                ?.map((d) => TagGroupModel.fromJson(d))
                ?.toList()
            : null,
        webLinks = (json.containsKey('webLinks'))
            ? (json['webLinks'] as List)
                ?.map((d) => WebLinkModel.fromJson(d))
                ?.toList()
            : null;

  static List<EntryModel> jsonToList(List items) {
    return items.map((i) => EntryModel.fromJson(i)).toList();
  }

  String get imageUrl {
    if (mainPicture != null) {
      return (entryType == EntryType.ReleaseEvent ||
              entryType == EntryType.ReleaseEventSeries)
          ? mainPicture.urlThumb.replaceAll('mainThumb', 'mainOrig')
          : mainPicture.urlThumb;
    }

    switch (entryType) {
      case EntryType.Artist:
        return '$baseUrl/Artist/Picture/$id';
      case EntryType.Album:
        return '$baseUrl/Album/CoverPicture/$id';
      default:
        return 'https://via.placeholder.com/150x150?text=no_image';
    }
  }

  static EntryType entryTypeToEnum(String str) {
    switch (str) {
      case 'Song':
        return EntryType.Song;
      case 'Artist':
        return EntryType.Artist;
      case 'Album':
        return EntryType.Album;
      case 'ReleaseEvent':
        return EntryType.ReleaseEvent;
      case 'Tag':
        return EntryType.Tag;
    }
    return EntryType.Undefined;
  }

  static String entryTypeEnumToString(EntryType entryType) {
    switch (entryType) {
      case EntryType.Song:
        return 'Song';
      case EntryType.Artist:
        return 'Artist';
      case EntryType.Album:
        return 'Artist';
      case EntryType.ReleaseEvent:
        return 'ReleaseEvent';
      case EntryType.Tag:
        return 'tag';
      default:
        return 'Undefined';
    }
  }

  String get activityDateFormatted => (activityDate == null)
      ? null
      : DateFormat('yyyy-MM-dd').format(DateTime.parse(activityDate));

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'songType': songType,
      'artistString': artistString,
      'mainPicture': mainPicture?.toJson(),
    };
  }
}

class EntryList {
  final List<EntryModel> entries;

  EntryList(this.entries);

  List<EntryModel> get songs =>
      entries.where((e) => e.entryType == EntryType.Song).toList();
  List<EntryModel> get artists =>
      entries.where((e) => e.entryType == EntryType.Artist).toList();
  List<EntryModel> get albums =>
      entries.where((e) => e.entryType == EntryType.Album).toList();
  List<EntryModel> get releaseEvents =>
      entries.where((e) => e.entryType == EntryType.ReleaseEvent).toList();
}

enum EntryType {
  Undefined,
  Song,
  Artist,
  Album,
  ReleaseEvent,
  Tag,
  ReleaseEventSeries
}
