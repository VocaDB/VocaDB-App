import 'package:equatable/equatable.dart';
import 'package:vocadb_app/models.dart';

class UserModel extends Equatable {
  int id;
  String name;
  MainPictureModel mainPicture;

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        mainPicture = json.containsKey('mainPicture')
            ? MainPictureModel.fromJson(json['mainPicture'] ?? {})
            : null;

  static List<UserModel> jsonToList(List items) {
    return items.map((i) => UserModel.fromJson(i)).toList();
  }

  get imageUrl => (mainPicture != null && mainPicture.urlThumb != null)
      ? mainPicture.urlThumb.replaceAll('-t.', '.')
      : null;

  @override
  List<Object> get props => [id, name];

  @override
  String toString() => 'UserModel { id: $id, name: $name }';
}
