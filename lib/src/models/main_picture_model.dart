import 'package:equatable/equatable.dart';

class MainPictureModel extends Equatable {
  String meme;
  String urlSmallThumb;
  String urlThumb;
  String urlTinyThumb;

  @override
  List<Object> get props => [meme, urlSmallThumb, urlThumb, urlTinyThumb];

  MainPictureModel({this.urlThumb});

  MainPictureModel.fromJson(Map<String, dynamic> json)
      : meme = json['meme'],
        urlSmallThumb = json['urlSmallThumb'],
        urlThumb = json['urlThumb'],
        urlTinyThumb = json['urlTinyThumb'];

  Map<String, dynamic> toJson() {
    return {
      'meme': meme,
      'urlSmallThumb': urlSmallThumb,
      'urlThumb': urlThumb,
      'urlTinyThumb': urlTinyThumb,
    };
  }

  String toString() {
    return toJson().toString();
  }
}
