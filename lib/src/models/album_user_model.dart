import 'package:vocadb_app/models.dart';

class AlbumUserModel {
  AlbumModel album;

  AlbumUserModel.fromJson(Map<String, dynamic> json)
      : album = json.containsKey('album')
            ? AlbumModel.fromJson(json['album'])
            : null;

  static List<AlbumUserModel> jsonToList(List items) {
    return (items == null)
        ? []
        : items.map((i) => AlbumUserModel.fromJson(i)).toList();
  }
}
