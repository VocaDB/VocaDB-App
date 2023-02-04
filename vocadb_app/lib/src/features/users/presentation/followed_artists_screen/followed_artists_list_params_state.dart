import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';
import 'package:vocadb_app/src/features/users/domain/followed_artists_list_params.dart';

class FollowedArtistsListParamsState
    extends StateNotifier<FollowedArtistsListParams> {
  FollowedArtistsListParamsState({String? query, String lang = 'Default'})
      : super(FollowedArtistsListParams(query: query, lang: lang));
  Future<void> updateArtistType(String value) async =>
      state = state.copyWith(artistType: value);
  Future<void> updateQuery(String value) async =>
      state = state.copyWith(query: value);
  Future<void> updateSort(String value) async =>
      state = state.copyWith(sort: value);
  Future<void> clearQuery() async => state = state.copyWith(query: null);
}

final followedArtistsListParamsStateProvider =
    StateNotifierProvider.autoDispose<FollowedArtistsListParamsState,
        FollowedArtistsListParams>((ref) {
  final preferredLang = ref.watch(userSettingsRepositoryProvider
      .select((value) => value.currentPreferredLang));
  return FollowedArtistsListParamsState(lang: preferredLang);
});
