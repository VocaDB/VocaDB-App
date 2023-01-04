import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';
import 'package:vocadb_app/src/features/songs/data/song_api_repository.dart';
import 'package:vocadb_app/src/features/songs/data/song_fake_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

abstract class SongRepository {
  Future<List<Song>> fetchSongsHighlighted({String lang = 'Default'});

  Future<List<Song>> fetchSongsList();

  Future<Song> fetchSongId(int id);

  Future<List<Song>> fetchSongsTopRated({
    String? lang,
    int? durationHours,
    String? filterBy,
    String? vocalist,
  });

  Future<List<Song>> fetchSongsDerived(int id, {String? lang});

  Future<List<Song>> fetchSongsRelated(int id, {String? lang});

  Future<void> rating(int id, String rating);
}

/// Song Repository Provider
final songRepositoryProvider = Provider.autoDispose<SongRepository>((ref) {
  final config = ref.read(flavorConfigProvider);

  return (config.useFakeData)
      ? ref.watch(songFakeRepositoryProvider)
      : ref.watch(songApiRepositoryProvider);
});

/// Song Repository method Provider
final songsHighlightedProvider = FutureProvider.autoDispose<List<Song>>((ref) {
  final songRepository = ref.watch(songRepositoryProvider);
  final userSettings = ref.watch(userSettingsRepositoryProvider);

  return songRepository.fetchSongsHighlighted(
      lang: userSettings.currentPreferredLang!);
});
