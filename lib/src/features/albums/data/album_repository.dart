import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/features/albums/data/album_api_repository.dart';
import 'package:vocadb_app/src/features/albums/data/album_fake_repository.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/domain/album_rate.dart';
import 'package:vocadb_app/src/features/albums/domain/albums_list_params.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';

abstract class AlbumRepository {
  /// Find albums
  Future<List<Album>> fetchAlbums({AlbumsListParams params});

  /// Gets a album by Id.
  Future<Album> fetchAlbumID(int id, {String lang = 'Default'});

  /// Gets list of upcoming or recent albums, same as front page.
  Future<List<Album>> fetchNew({String lang = 'Default'});

  /// Gets list of top rated albums, same as front page.
  Future<List<Album>> fetchTop({String lang = 'Default'});

  Future<List<Album>> fetchTopAlbumsByTagID(int tagID,
      {String lang = 'Default'});

  Future<void> rateAlbum(int albumId, AlbumRate rateValue);
}

/// Album Repository Provider
final albumRepositoryProvider = Provider.autoDispose<AlbumRepository>((ref) {
  final config = ref.read(flavorConfigProvider);
  return (config.useFakeData)
      ? ref.watch(albumFakeRepositoryProvider)
      : ref.watch(albumApiRepositoryProvider);
});

/// Albums new Provider
final albumsNewProvider = FutureProvider.autoDispose<List<Album>>((ref) {
  final albumRepository = ref.watch(albumRepositoryProvider);
  final userSettings = ref.watch(userSettingsRepositoryProvider);

  return albumRepository.fetchNew(
    lang: userSettings.currentPreferredLang,
  );
});

/// Albums top Provider
final albumsTopProvider = FutureProvider.autoDispose<List<Album>>((ref) {
  final albumRepository = ref.watch(albumRepositoryProvider);
  final userSettings = ref.watch(userSettingsRepositoryProvider);

  return albumRepository.fetchTop(
    lang: userSettings.currentPreferredLang,
  );
});

/// Album ID Provider
final albumDetailProvider =
    FutureProvider.autoDispose.family<Album, int>((ref, id) {
  final albumRepository = ref.watch(albumRepositoryProvider);
  final preferredLang = ref.watch(userSettingsRepositoryProvider
      .select((value) => value.currentPreferredLang));
  return albumRepository.fetchAlbumID(id, lang: preferredLang);
});