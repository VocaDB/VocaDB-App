import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required int id,
    required String name,
    MainPicture? mainPicture,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
