import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_picture.freezed.dart';
part 'main_picture.g.dart';

@freezed
class MainPicture with _$MainPicture {
  factory MainPicture({
    String? mime,
    String? urlSmallThumb,
    String? urlThumb,
    String? urlTinyThumb,
    String? urlOriginal,
  }) = _MainPicture;

  factory MainPicture.fromJson(Map<String, dynamic> json) =>
      _$MainPictureFromJson(json);
}
