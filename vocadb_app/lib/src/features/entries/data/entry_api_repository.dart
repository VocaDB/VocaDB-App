import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/api/data/api_query_result.dart';
import 'package:vocadb_app/src/features/entries/data/entry_repository.dart';
import 'package:vocadb_app/src/features/entries/domain/entries_list_params.dart';
import 'package:vocadb_app/src/features/entries/domain/entry.dart';

class EntryApiRepository implements EntryRepository {
  final ApiClient client;

  EntryApiRepository({required this.client});

  @override
  Future<List<Entry>> fetchEntriesList(
      {EntriesListParams params = const EntriesListParams()}) async {
    final response = await client.get('/api/entries', params: params.toJson());

    final queryResponse = ApiQueryResult.fromMap(response);

    return Entry.fromJsonToList(queryResponse.items);
  }
}

final entryApiRepositoryProvider = Provider<EntryApiRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return EntryApiRepository(client: apiClient);
});
