import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/features/artists/data/artist_api_repository.dart';
import 'package:vocadb_app/src/features/artists/data/artist_fake_repository.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/domain/artists_list_params.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';

abstract class ArtistRepository {
  Future<List<Artist>> fetchList({ArtistsListParams params});

  Future<Artist> fetchArtistID(int id, {String lang = 'Default'});
}

final artistRepositoryProvider = Provider.autoDispose<ArtistRepository>((ref) {
  final config = ref.read(flavorConfigProvider);
  return (config.useFakeData)
      ? ref.watch(artistFakeRepositoryProvider)
      : ref.watch(artistApiRepositoryProvider);
});

/// Album ID Provider
final artistDetailProvider =
    FutureProvider.autoDispose.family<Artist, int>((ref, id) {
  final artistRepository = ref.watch(artistRepositoryProvider);
  final preferredLang = ref.watch(userSettingsRepositoryProvider
      .select((value) => value.currentPreferredLang));
  return artistRepository.fetchArtistID(id, lang: preferredLang);
});
