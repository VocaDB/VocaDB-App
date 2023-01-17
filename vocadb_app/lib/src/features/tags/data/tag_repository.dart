import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/tags/data/tag_api_repository.dart';
import 'package:vocadb_app/src/features/tags/data/tag_fake_repository.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';

abstract class TagRepository {
  Future<Tag> fetchTagID(int id, {String lang = 'Default'});
}

final tagRepositoryProvider = Provider.autoDispose<TagRepository>((ref) {
  final config = ref.read(flavorConfigProvider);
  return (config.useFakeData)
      ? ref.watch(tagFakeRepositoryProvider)
      : ref.watch(tagApiRepositoryProvider);
});

/// Tag ID Provider
final tagDetailProvider =
    FutureProvider.autoDispose.family<Tag, int>((ref, id) {
  final tagRepository = ref.watch(tagRepositoryProvider);
  final preferredLang = ref.watch(userSettingsRepositoryProvider
      .select((value) => value.currentPreferredLang));
  return tagRepository.fetchTagID(id, lang: preferredLang);
});
final topSongsByTagIdProvider =
    FutureProvider.autoDispose.family<List<Song>, int>((ref, id) {
  final tagDetail = ref.watch(tagDetailProvider(id));
  final songRepository = ref.watch(songRepositoryProvider);
  final preferredLang = ref.watch(userSettingsRepositoryProvider
      .select((value) => value.currentPreferredLang));

  return tagDetail.when(
    data: (data) {
      return songRepository.fetchTopSongsByTagID(id, lang: preferredLang);
    },
    error: (er, r) => [],
    loading: () => [],
  );
});
