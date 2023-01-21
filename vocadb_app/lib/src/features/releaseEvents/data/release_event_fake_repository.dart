import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/constants/fake_release_events_list.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_repository.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_events_list_params.dart';

class ReleaseEventFakeRepository implements ReleaseEventRepository {
  @override
  Future<List<ReleaseEvent>> fetchReleaseEventsList(
      {ReleaseEventsListParams params = const ReleaseEventsListParams()}) {
    return Future.value(kFakeReleaseEventsList);
  }

  @override
  Future<List<ReleaseEvent>> fetchRecentEvents({String lang = 'Default'}) {
    return fetchReleaseEventsList();
  }
}

final releaseEventFakeRepositoryProvider =
    Provider<ReleaseEventFakeRepository>((ref) {
  return ReleaseEventFakeRepository();
});
