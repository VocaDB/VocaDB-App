import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_api_repository.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_fake_repository.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_events_list_params.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';

abstract class ReleaseEventRepository {
  Future<List<ReleaseEvent>> fetchReleaseEventsList({
    ReleaseEventsListParams params,
  });
  Future<List<ReleaseEvent>> fetchRecentEvents({String lang = 'Default'});
}

final releaseEventRepositoryProvider = Provider<ReleaseEventRepository>((ref) {
  final config = ref.read(flavorConfigProvider);
  return (config.useFakeData)
      ? ref.watch(releaseEventFakeRepositoryProvider)
      : ref.watch(releaseEventApiRepositoryProvider);
});

final recentEventsProvider = FutureProvider<List<ReleaseEvent>>((ref) async {
  final releaseEventRepository = ref.watch(releaseEventRepositoryProvider);
  final preferredLang = ref.watch(userSettingsRepositoryProvider
      .select((value) => value.currentPreferredLang));
  return releaseEventRepository.fetchRecentEvents(lang: preferredLang);
});
