import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/features/entries/data/entry_api_repository.dart';
import 'package:vocadb_app/src/features/entries/data/entry_fake_repository.dart';
import 'package:vocadb_app/src/features/entries/domain/entries_list_params.dart';
import 'package:vocadb_app/src/features/entries/domain/entries_list_params_state.dart';
import 'package:vocadb_app/src/features/entries/domain/entry.dart';

abstract class EntryRepository {
  Future<List<Entry>> fetchEntriesList({EntriesListParams params});
}

final entryRepositoryProvider = Provider.autoDispose<EntryRepository>((ref) {
  final config = ref.read(flavorConfigProvider);
  return (config.useFakeData)
      ? ref.watch(entryFakeRepositoryProvider)
      : ref.watch(entryApiRepositoryProvider);
});

final entriesListProvider =
    FutureProvider.autoDispose<List<Entry>>((ref) async {
  final entryRepository = ref.watch(entryRepositoryProvider);
  final params = ref.watch(entriesListParamsStateProvider);
  return entryRepository.fetchEntriesList(params: params);
});
