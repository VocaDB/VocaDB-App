import 'package:freezed_annotation/freezed_annotation.dart';

part 'rated_songs_list_params.freezed.dart';
part 'rated_songs_list_params.g.dart';

@freezed
class RatedSongsListParams with _$RatedSongsListParams {
  factory RatedSongsListParams({
    String? query,
    List<int>? tagId,
    List<int>? artistId,
    String? rating,
    @Default(0) int start,
    @Default(10) int maxResults,
    @Default('RatingDate') String sort,
    @Default('MainPicture,PVs') String fields,
    @Default('Default') String lang,
  }) = _RatedSongsListParams;

  factory RatedSongsListParams.fromJson(Map<String, dynamic> json) =>
      _$RatedSongsListParamsFromJson(json);
}
