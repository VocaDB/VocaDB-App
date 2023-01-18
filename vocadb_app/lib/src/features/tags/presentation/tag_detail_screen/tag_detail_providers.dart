// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/artists/data/artist_repository.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/tags/data/tag_repository.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';

final tagDetailProvider =
    FutureProvider.autoDispose.family<Tag, int>((ref, tagID) async {
  final tagRepository = ref.watch(tagRepositoryProvider);
  return tagRepository.fetchTagID(tagID);
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

final topArtistsByTagIdProvider =
    FutureProvider.autoDispose.family<List<Artist>, int>((ref, id) {
  final tagDetail = ref.watch(tagDetailProvider(id));
  final artistRepository = ref.watch(artistRepositoryProvider);
  final preferredLang = ref.watch(userSettingsRepositoryProvider
      .select((value) => value.currentPreferredLang));

  return tagDetail.when(
    data: (data) {
      return artistRepository.fetchTopArtistsByTagID(id, lang: preferredLang);
    },
    error: (er, r) => [],
    loading: () => [],
  );
});
