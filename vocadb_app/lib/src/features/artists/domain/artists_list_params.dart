import 'package:freezed_annotation/freezed_annotation.dart';

part 'artists_list_params.freezed.dart';
part 'artists_list_params.g.dart';

@freezed
class ArtistsListParams with _$ArtistsListParams {
  @JsonSerializable(includeIfNull: false)
  const factory ArtistsListParams({
    String? query,
    String? artistTypes,
    List<int>? tagId,
    @Default(0) int start,
    @Default(10) int maxResults,
    @Default('None') String sort,
    @Default('Auto') String nameMatchMode,
    @Default('MainPicture') String fields,
    @Default('Default') String lang,
  }) = _ArtistsListParams;

  factory ArtistsListParams.fromJson(Map<String, dynamic> json) =>
      _$ArtistsListParamsFromJson(json);
}
