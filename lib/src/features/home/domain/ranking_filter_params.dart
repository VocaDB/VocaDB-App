import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_filter_params.freezed.dart';
part 'ranking_filter_params.g.dart';

@freezed
class RankingFilterParams with _$RankingFilterParams {
  @JsonSerializable(includeIfNull: false)
  const factory RankingFilterParams({
    @Default('CreateDate') String filterBy,
    @Default('Nothing') String vocalist,
  }) = _RankingFilterParams;

  factory RankingFilterParams.fromJson(Map<String, dynamic> json) =>
      _$RankingFilterParamsFromJson(json);
}
