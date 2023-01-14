import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/artists/domain/artists_list_params.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';

class ArtistsListParamsState extends StateNotifier<ArtistsListParams> {
  ArtistsListParamsState({String lang = 'Default'})
      : super(ArtistsListParams(lang: lang));
  void updateArtistTypes(String? value) =>
      state = state.copyWith(artistTypes: value);
  void updateQuery(String value) => state = state.copyWith(query: value);
  void updateSort(String value) => state = state.copyWith(sort: value);
  void clearQuery() => state = state.copyWith(query: null);
}

final artistsListParamsStateProvider = StateNotifierProvider.autoDispose<
    ArtistsListParamsState, ArtistsListParams>((ref) {
  final preferredLang = ref.watch(preferredStateChangesProvider);
  return ArtistsListParamsState(lang: preferredLang.value!);
});
