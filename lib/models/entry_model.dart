import 'dart:convert';

import 'package:vocadb/models/main_picture_model.dart';
import 'package:vocadb/services/web_service.dart';

class EntryModel {
  int id;
  EntryType entryType;
  String name;
  String artistString;
  String artistType;
  MainPictureModel mainPicture;

  EntryModel();

  EntryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        entryType = entryTypeToEnum(json['entryType']),
        artistString = json['artistString'],
        artistType = json['artistType'],
        mainPicture = json.containsKey('mainPicture')
            ? MainPictureModel.fromJson(json['mainPicture'])
            : null;

  String get imageUrl {
    if (mainPicture != null) {
      return mainPicture.urlThumb;
    }

    switch (entryType) {
      case EntryType.Artist:
        return 'https://vocadb.net/Artist/Picture/$id';
      case EntryType.Album:
        return 'https://vocadb.net/Album/CoverPicture/$id';
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

  static Resource<List<EntryModel>> query(String query) {
    return Resource(
        endpoint:
            '/api/entries?query=$query&fields=MainPicture&nameMatchMode=auto',
        parse: (response) {
          Iterable result = json.decode(response.body)['items'];
          return result.map((model) => EntryModel.fromJson(model)).toList();
        });
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
}

enum EntryType { Undefined, Song, Artist, Album, ReleaseEvent, Tag }
