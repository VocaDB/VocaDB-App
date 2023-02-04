import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';
import 'package:vocadb_app/src/features/users/domain/user_albums_list_params.dart';

class UserAlbumsListParamsState extends StateNotifier<UserAlbumsListParams> {
  UserAlbumsListParamsState({
    String? query,
    String lang = 'Default',
  }) : super(UserAlbumsListParams(
          query: query,
          lang: lang,
        ));

  Future<void> updatePurchaseStatuses(String value) async =>
      state = state.copyWith(purchaseStatuses: value);

  Future<void> updateAlbumTypes(String value) async =>
      state = state.copyWith(albumTypes: value);

  Future<void> updateQuery(String value) async =>
      state = state.copyWith(query: value);

  Future<void> updateSort(String value) async =>
      state = state.copyWith(sort: value);

  Future<void> clearQuery() async => state = state.copyWith(query: null);
}

final userAlbumsListParamsStateProvider = StateNotifierProvider.autoDispose<
    UserAlbumsListParamsState, UserAlbumsListParams>((ref) {
  final preferredLang = ref.watch(userSettingsRepositoryProvider
      .select((value) => value.currentPreferredLang));
  return UserAlbumsListParamsState(lang: preferredLang);
});
