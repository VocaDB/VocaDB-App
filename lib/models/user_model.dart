import 'package:vocadb/models/main_picture_model.dart';

class UserModel {
  int id;
  String name;
  MainPictureModel mainPicture;

  UserModel();

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        mainPicture = json.containsKey('mainPicture')
            ? MainPictureModel.fromJson(json['mainPicture'] ?? {})
            : null;

  String get imageUrl {
    if (mainPicture != null) {
      return mainPicture.urlThumb;
    }

    return null;
  }

  String toString() {
    return {"id": id, "name": name, "name": name}.toString();
  }
}
