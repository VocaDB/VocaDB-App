import 'package:dio/dio.dart';
import 'package:vocadb/models/base_model.dart';
import 'package:vocadb/models/main_picture_model.dart';
import 'package:vocadb/models/tag_group_model.dart';
import 'package:vocadb/services/web_service.dart';

class EntryModel extends BaseModel {
  int id;
  EntryType entryType;
  String additionalNames;
  String defaultName;
  String name;
  String artistString;
  String artistType;
  String songType;
  MainPictureModel mainPicture;
  List<TagGroupModel> tagGroups;

  EntryModel();

  EntryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        songType = json['songType'],
        additionalNames = json['additionalNames'],
        defaultName = json['defaultName'],
        entryType = entryTypeToEnum(json['entryType']),
        artistString = json['artistString'],
        artistType = json['artistType'],
        mainPicture = json.containsKey('mainPicture')
            ? MainPictureModel.fromJson(json['mainPicture'])
            : null,
        tagGroups = (json.containsKey('tags'))
            ? (json['tags'] as List)
                ?.map((d) => TagGroupModel.fromJson(d))
                ?.toList()
            : null;

  static List<EntryModel> jsonToList(List items) {
    return items.map((i) => EntryModel.fromJson(i)).toList();
  }

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
        parse: (Response response) {
          Iterable result = response.data['items'];
          return result.map((model) => EntryModel.fromJson(model)).toList();
        });
  }

  @override
  String toString() {
    return {'id': 1, 'name': name}.toString();
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
