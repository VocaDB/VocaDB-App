import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_api_repository.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_fake_repository.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_events_list_params.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

abstract class ReleaseEventRepository {
  Future<List<ReleaseEvent>> fetchReleaseEventsList({
    ReleaseEventsListParams params,
  });
  Future<List<ReleaseEvent>> fetchRecentEvents({String lang = 'Default'});

  Future<ReleaseEvent> fetchReleaseEventByID(int id, {String lang = 'Default'});

  Future<List<Song>> fetchPublishedSongs(int id, {String lang = 'Default'});

  Future<List<Album>> fetchAlbums(int id, {String lang = 'Default'});
}

final releaseEventRepositoryProvider =
    Provider.autoDispose<ReleaseEventRepository>((ref) {
  final config = ref.read(flavorConfigProvider);
  return (config.useFakeData)
      ? ref.watch(releaseEventFakeRepositoryProvider)
      : ref.watch(releaseEventApiRepositoryProvider);
});

final recentEventsProvider =
    FutureProvider.autoDispose<List<ReleaseEvent>>((ref) async {
  final releaseEventRepository = ref.watch(releaseEventRepositoryProvider);
  final preferredLang = ref.watch(userSettingsRepositoryProvider
      .select((value) => value.currentPreferredLang));
  return releaseEventRepository.fetchRecentEvents(lang: preferredLang);
});

final releaseEventDetailProvider =
    FutureProvider.autoDispose.family<ReleaseEvent, int>((ref, id) {
  final releaseEventRepository = ref.watch(releaseEventRepositoryProvider);
  final preferredLang = ref.watch(userSettingsRepositoryProvider
      .select((value) => value.currentPreferredLang));
  return releaseEventRepository.fetchReleaseEventByID(id, lang: preferredLang);
});

final releaseEventAlbumsProvider =
    FutureProvider.autoDispose.family<List<Album>, int>((ref, id) async {
  ref.watch(releaseEventDetailProvider(id));
  final releaseEventRepository = ref.watch(releaseEventRepositoryProvider);
  final preferredLang = ref.watch(userSettingsRepositoryProvider
      .select((value) => value.currentPreferredLang));
  return releaseEventRepository.fetchAlbums(id, lang: preferredLang);
});

final releaseEventPublishedSongsProvider =
    FutureProvider.autoDispose.family<List<Song>, int>((ref, id) async {
  ref.watch(releaseEventDetailProvider(id));
  final releaseEventRepository = ref.watch(releaseEventRepositoryProvider);
  final preferredLang = ref.watch(userSettingsRepositoryProvider
      .select((value) => value.currentPreferredLang));
  return releaseEventRepository.fetchPublishedSongs(id, lang: preferredLang);
});
