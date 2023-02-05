import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';

part 'user_albums_list_params.freezed.dart';
part 'user_albums_list_params.g.dart';

@freezed
class UserAlbumsListParams with _$UserAlbumsListParams {
  @JsonSerializable(includeIfNull: false)
  const factory UserAlbumsListParams(
      {String? query,
      @Default(0) int start,
      @Default(10) int maxResults,
      @Default('All') String purchaseStatuses,
      @Default('Unknown') String albumTypes,
      @Default('Name') String sort,
      @Default('MainPicture') String fields,
      @Default('Default') String lang,
      @Default('Auto') String nameMatchMode,
      String? mediaType}) = _UserAlbumsListParams;

  factory UserAlbumsListParams.fromJson(Map<String, dynamic> json) =>
      _$UserAlbumsListParamsFromJson(json);
}
