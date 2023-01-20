import 'package:freezed_annotation/freezed_annotation.dart';

part 'albums_list_params.freezed.dart';
part 'albums_list_params.g.dart';

@freezed
class AlbumsListParams with _$AlbumsListParams {
  @JsonSerializable(includeIfNull: false)
  const factory AlbumsListParams({
    String? query,
    String? discTypes,
    @JsonKey(name: 'tagId[]') List<int>? tagId,
    @Default(0) int start,
    @Default(10) int maxResults,
    @Default('None') String sort,
    @Default('Auto') String nameMatchMode,
    @Default('MainPicture') String fields,
    @Default('Default') String lang,
  }) = _AlbumsListParams;

  factory AlbumsListParams.fromJson(Map<String, dynamic> json) =>
      _$AlbumsListParamsFromJson(json);
}
