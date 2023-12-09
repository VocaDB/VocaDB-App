import 'package:freezed_annotation/freezed_annotation.dart';

part 'entries_list_params.freezed.dart';
part 'entries_list_params.g.dart';

@freezed
class EntriesListParams with _$EntriesListParams {
  @JsonSerializable(includeIfNull: false)
  const factory EntriesListParams({
    String? query,
    String? entryTypes,
    @JsonKey(name: 'tagId[]') List<int>? tagId,
    @Default(0) int start,
    @Default(10) int maxResults,
    @Default('None') String sort,
    @Default('Auto') String nameMatchMode,
    @Default('MainPicture') String fields,
    @Default('Default') String lang,
  }) = _EntriesListParams;

  factory EntriesListParams.fromJson(Map<String, dynamic> json) =>
      _$EntriesListParamsFromJson(json);
}
