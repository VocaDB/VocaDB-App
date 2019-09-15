import 'package:vocadb/models/main_picture_model.dart';

class EntryModel {
  int id;
  EntryType entryType;
  String name;
  String artistString;
  String artistType;
  MainPictureModel mainPicture;

  EntryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        entryType = entryTypeToEnum(json['entryType']),
        artistString = json['artistString'],
        artistType = json['artistType'],
        mainPicture = json.containsKey('mainPicture')
            ? MainPictureModel.fromJson(json['mainPicture'])
            : null;

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
}

enum EntryType { Undefined, Song, Artist, Album, ReleaseEvent, Tag }
