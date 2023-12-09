import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';
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
