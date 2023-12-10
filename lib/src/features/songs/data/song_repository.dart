import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_filter_params_state.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';
import 'package:vocadb_app/src/features/songs/data/constants/duration_hours.dart';
import 'package:vocadb_app/src/features/songs/data/song_api_repository.dart';
import 'package:vocadb_app/src/features/songs/data/song_fake_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/domain/song_related.dart';
import 'package:vocadb_app/src/features/songs/domain/songs_list_params.dart';

abstract class SongRepository {
  Future<List<Song>> fetchSongsHighlighted({String lang = 'Default'});

  Future<List<Song>> fetchSongsList({SongsListParams params});

  Future<Song> fetchSongId(int id, {String lang = 'Default'});

  Future<List<Song>> fetchSongsTopRated({
    String lang = 'Default',
    int durationHours = 0,
    String filterBy = 'CreateDate',
    String vocalist = 'Nothing',
  });

  Future<List<Song>> fetchSongsDerived(int id, {String lang = 'Default'});

  Future<SongRelated> fetchSongsRelated(int id, {String lang = 'Default'});

  Future<void> rating(int id, String rating);

  Future<List<Song>> fetchTopSongsByTagID(int tagId, {String lang = 'Default'});
}

/// Providers

/// Song Repository Provider
final songRepositoryProvider = Provider.autoDispose<SongRepository>((ref) {
  final config = ref.read(flavorConfigProvider);

  return (config.useFakeData)
      ? ref.watch(songFakeRepositoryProvider)
      : ref.watch(songApiRepositoryProvider);
});

/// Songs Highlighed Provider
final songsHighlightedProvider = FutureProvider.autoDispose<List<Song>>((ref) {
  final songRepository = ref.watch(songRepositoryProvider);
  final preferredLang = ref.watch(preferredStateChangesProvider);

  return songRepository.fetchSongsHighlighted(lang: preferredLang.value!);
});

/// SongsID Provider
final songDetailProvider =
    FutureProvider.autoDispose.family<Song, int>((ref, id) {
  final songRepository = ref.watch(songRepositoryProvider);
  final preferredLang = ref.watch(preferredStateChangesProvider);

  return songRepository.fetchSongId(id, lang: preferredLang.value!);
});

// Songs Daily Ranking Provider
final songsDailyProvider = FutureProvider.autoDispose<List<Song>>((ref) {
  final durationHours = DurationHours.daily.value;
  final songRepository = ref.watch(songRepositoryProvider);
  final rankingFilter = ref.watch(rankingFilterParamsStateProvider);
  final userSettings = ref.watch(userSettingsRepositoryProvider);

  return songRepository.fetchSongsTopRated(
    durationHours: durationHours,
    lang: userSettings.currentPreferredLang,
    filterBy: rankingFilter.filterBy,
    vocalist: rankingFilter.vocalist
  );
});

// Songs Weekly Ranking Provider
final songsWeeklyProvider = FutureProvider.autoDispose<List<Song>>((ref) {
  final durationHours = DurationHours.weekly.value;
  final songRepository = ref.watch(songRepositoryProvider);
  final rankingFilter = ref.watch(rankingFilterParamsStateProvider);
  final userSettings = ref.watch(userSettingsRepositoryProvider);

  return songRepository.fetchSongsTopRated(
    durationHours: durationHours,
    lang: userSettings.currentPreferredLang,
    filterBy: rankingFilter.filterBy,
    vocalist: rankingFilter.vocalist
  );
});

// Songs Monthly Ranking Provider
final songsMonthlyProvider = FutureProvider.autoDispose<List<Song>>((ref) {
  final durationHours = DurationHours.monthly.value;
  final songRepository = ref.watch(songRepositoryProvider);
  final rankingFilter = ref.watch(rankingFilterParamsStateProvider);
  final userSettings = ref.watch(userSettingsRepositoryProvider);

  return songRepository.fetchSongsTopRated(
    durationHours: durationHours,
    lang: userSettings.currentPreferredLang,
    filterBy: rankingFilter.filterBy,
    vocalist: rankingFilter.vocalist
  );
});

// Songs Overall Ranking Provider
final songsOverallProvider = FutureProvider.autoDispose<List<Song>>((ref) {
  final songRepository = ref.watch(songRepositoryProvider);
  final rankingFilter = ref.watch(rankingFilterParamsStateProvider);
  final userSettings = ref.watch(userSettingsRepositoryProvider);

  return songRepository.fetchSongsTopRated(
    lang: userSettings.currentPreferredLang,
    filterBy: rankingFilter.filterBy,
    vocalist: rankingFilter.vocalist
  );
});

// Songs Derived Provider
final songsDerivedProvider =
    FutureProvider.autoDispose.family<List<Song>, int>((ref, id) async {
  final songRepository = ref.watch(songRepositoryProvider);
  final userSettings = ref.watch(userSettingsRepositoryProvider);

  final value = songRepository.fetchSongsDerived(
    id,
    lang: userSettings.currentPreferredLang,
  );

  return value;
});

// Songs Related Provider
final songsRelatedProvider =
    FutureProvider.autoDispose.family<SongRelated, int>((ref, id) async {
  final songRepository = ref.watch(songRepositoryProvider);
  final userSettings = ref.watch(userSettingsRepositoryProvider);

  final value = songRepository.fetchSongsRelated(
    id,
    lang: userSettings.currentPreferredLang,
  );

  return value;
});
