import 'package:freezed_annotation/freezed_annotation.dart';

part 'release_events_list_params.freezed.dart';
part 'release_events_list_params.g.dart';

@freezed
class ReleaseEventsListParams with _$ReleaseEventsListParams {
  @JsonSerializable(includeIfNull: false)
  const factory ReleaseEventsListParams({
    String? query,
    @Default('Date') String? sort,
    @JsonKey(name: 'tagId[]') List<int>? tagId,
    @JsonKey(name: 'artistId[]') List<int>? artistId,
    DateTime? afterDate,
    DateTime? beforeDate,
    @Default(0) start,
    @Default(10) maxResult,
    @Default('MainPicture') fields,
    @Default('Default') lang,
  }) = _ReleaseEventsListParams;

  factory ReleaseEventsListParams.fromJson(Map<String, dynamic> json) =>
      _$ReleaseEventsListParamsFromJson(json);
}
