import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';

part 'rated_songs_list_params.freezed.dart';
part 'rated_songs_list_params.g.dart';

@freezed
class RatedSongsListParams with _$RatedSongsListParams {
  @JsonSerializable(includeIfNull: false)
  const factory RatedSongsListParams({
    String? query,
    List<int>? tagId,
    List<int>? artistId,
    @JsonKey(ignore: true) List<Artist>? artists,
    @Default('Nothing') String rating,
    @Default(0) int start,
    @Default(10) int maxResults,
    @Default('RatingDate') String sort,
    @Default('MainPicture,PVs') String fields,
    @Default('Default') String lang,
  }) = _RatedSongsListParams;

  factory RatedSongsListParams.fromJson(Map<String, dynamic> json) =>
      _$RatedSongsListParamsFromJson(json);
}

final ratedSongsListParamsStateProvider =
    StateProvider<RatedSongsListParams>((ref) {
  final preferredLang = ref.watch(preferredStateChangesProvider);
  return RatedSongsListParams(lang: preferredLang.value!);
});
