import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/entries/domain/entries_list_params.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';

class EntriesListParamsState extends StateNotifier<EntriesListParams> {
  EntriesListParamsState({String lang = 'Default'})
      : super(EntriesListParams(lang: lang));
  void updateEntryTypes(String? value) =>
      state = state.copyWith(entryTypes: value);
  void updateQuery(String value) => state = state.copyWith(query: value);
  void updateSort(String value) => state = state.copyWith(sort: value);
  void clearQuery() => state = state.copyWith(query: null);
}

final entriesListParamsStateProvider = StateNotifierProvider.autoDispose<
    EntriesListParamsState, EntriesListParams>((ref) {
  final preferredLang = ref.watch(userSettingsRepositoryProvider
      .select((value) => value.currentPreferredLang));
  return EntriesListParamsState(lang: preferredLang);
});
