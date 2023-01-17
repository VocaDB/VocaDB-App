import 'package:freezed_annotation/freezed_annotation.dart';

part 'songs_list_params.freezed.dart';
part 'songs_list_params.g.dart';

@freezed
class SongsListParams with _$SongsListParams {
  @JsonSerializable(includeIfNull: false)
  const factory SongsListParams({
    String? query,
    String? songTypes,
    @Default('None') String sort,
    @JsonKey(name: 'artistId') List<int>? artistId,
    @JsonKey(name: 'tagId[]') List<int>? tagId,
    @Default(0) int start,
    @Default(10) int maxResults,
    @Default('ThumbUrl,PVs,MainPicture') String fields,
    @Default('Default') String lang,
    @Default('Auto') String nameMatchMode,
  }) = _SongsListParams;

  factory SongsListParams.fromJson(Map<String, dynamic> json) =>
      _$SongsListParamsFromJson(json);
}
