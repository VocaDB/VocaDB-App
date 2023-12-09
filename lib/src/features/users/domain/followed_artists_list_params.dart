import 'package:freezed_annotation/freezed_annotation.dart';

part 'followed_artists_list_params.freezed.dart';
part 'followed_artists_list_params.g.dart';

@freezed
class FollowedArtistsListParams with _$FollowedArtistsListParams {
  @JsonSerializable(includeIfNull: false)
  const factory FollowedArtistsListParams({
    String? query,
    @JsonKey(name: 'tagId[]') List<int>? tagId,
    @Default(0) int start,
    @Default(10) int maxResults,
    String? artistType,
    @Default('Name') String sort,
    @Default('MainPicture') String fields,
    @Default('Default') String lang,
  }) = _FollowedArtistsListParams;

  factory FollowedArtistsListParams.fromJson(Map<String, dynamic> json) =>
      _$FollowedArtistsListParamsFromJson(json);
}
