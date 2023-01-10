import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/rated_song.dart';
import 'package:vocadb_app/src/features/users/data/request/rated_songs_list_params.dart';
import 'package:vocadb_app/src/features/users/data/user_api_repository.dart';
import 'package:vocadb_app/src/features/users/data/user_fake_repository.dart';

abstract class UserRepository {
  Future<String> fetchRatedSongID(int userID, int songID);

  Future<List<RatedSong>> fetchRatedSongsList(
    int userID,
    RatedSongsListParams params,
  );
}

/// Providers

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final config = ref.read(flavorConfigProvider);
  return (config.useFakeData)
      ? ref.watch(userFakeRepositoryProvider)
      : ref.watch(userApiRepositoryProvider);
});

final ratedSongsListParamsStateProvider =
    StateProvider<RatedSongsListParams>((ref) {
  final preferredLang = ref.watch(preferredStateChangesProvider);
  return RatedSongsListParams(lang: preferredLang.value!);
});

final currentUserRatedSongsListProvider =
    FutureProvider.autoDispose<List<RatedSong>>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  final params = ref.watch(ratedSongsListParamsStateProvider);

  if (authRepository.currentUser == null) {
    return [];
  }

  return userRepository.fetchRatedSongsList(
    int.parse(authRepository.currentUser!.id),
    params,
  );
});
