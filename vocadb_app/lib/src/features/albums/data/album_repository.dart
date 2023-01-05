import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/features/albums/data/album_api_repository.dart';
import 'package:vocadb_app/src/features/albums/data/album_fake_repository.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';

abstract class AlbumRepository {
  /// Find albums
  Future<List<Album>> fetchAlbums({String lang = 'Default'});

  /// Gets a album by Id.
  Future<Album> fetchAlbumID(int id, {String lang = 'Default'});

  /// Gets list of upcoming or recent albums, same as front page.
  Future<List<Album>> fetchNew({String lang = 'Default'});

  /// Gets list of top rated albums, same as front page.
  Future<List<Album>> fetchTop({String lang = 'Default'});
}

/// Album Repository Provider
final albumRepositoryProvider = Provider<AlbumRepository>((ref) {
  final config = ref.read(flavorConfigProvider);

  return (config.useFakeData)
      ? ref.watch(albumFakeRepositoryProvider)
      : ref.watch(albumApiRepositoryProvider);
});

/// Albums new Provider
final albumsNewProvider = FutureProvider<List<Album>>((ref) {
  final albumRepository = ref.watch(albumRepositoryProvider);
  final userSettings = ref.watch(userSettingsRepositoryProvider);

  return albumRepository.fetchNew(
    lang: userSettings.currentPreferredLang!,
  );
});

/// Albums new Provider
final albumsTopProvider = FutureProvider<List<Album>>((ref) {
  final albumRepository = ref.watch(albumRepositoryProvider);
  final userSettings = ref.watch(userSettingsRepositoryProvider);

  return albumRepository.fetchTop(
    lang: userSettings.currentPreferredLang!,
  );
});
