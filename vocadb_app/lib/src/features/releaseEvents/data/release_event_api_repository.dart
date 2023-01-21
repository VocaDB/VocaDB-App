import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/api/data/api_query_result.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_repository.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_events_list_params.dart';

class ReleaseEventApiRepository implements ReleaseEventRepository {
  final ApiClient client;

  ReleaseEventApiRepository({
    required this.client,
  });

  @override
  Future<List<ReleaseEvent>> fetchReleaseEventsList(
      {ReleaseEventsListParams params =
          const ReleaseEventsListParams()}) async {
    final response =
        await client.get('/api/releaseEvents', params: params.toJson());

    final queryResult = ApiQueryResult.fromMap(response);

    return ReleaseEvent.fromJsonToList(queryResult.items).toList();
  }

  @override
  Future<List<ReleaseEvent>> fetchRecentEvents({String lang = 'Default'}) {
    return fetchReleaseEventsList(
        params: ReleaseEventsListParams(
      sort: 'Date',
      lang: lang,
      afterDate: DateTime.now().subtract(const Duration(days: 3)),
      beforeDate: DateTime.now().subtract(const Duration(days: 12)),
    ));
  }
}

final releaseEventApiRepositoryProvider =
    Provider<ReleaseEventApiRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ReleaseEventApiRepository(client: apiClient);
});
