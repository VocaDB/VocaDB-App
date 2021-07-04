import 'package:equatable/equatable.dart';
import 'package:vocadb_app/models.dart';

class AlbumUserModel extends Equatable {
  final AlbumModel album;

  @override
  List<Object> get props => [album];

  AlbumUserModel({this.album});

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
