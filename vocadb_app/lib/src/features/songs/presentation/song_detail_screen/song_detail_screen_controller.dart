import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/exceptions/require_login_exception.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/songs/data/constants/song_rating.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/domain/song_related.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_state.dart';

class SongDetailScreenController extends StateNotifier<SongDetailState> {
  SongDetailScreenController({
    required this.songRepository,
    required this.authRepository,
    required this.song,
  }) : super(
          SongDetailState(
            song: AsyncValue.data(song),
            relatedSongs: const AsyncValue.data(
              SongRelated(),
            ),
          ),
        );

  final SongRepository songRepository;

  final AuthRepository authRepository;

  final Song song;

  /// Load song detail first, if success then load related song next.
  Future<void> init() async {
    final isSuccess = await _loadDetail();
    if (isSuccess) {
      await _loadRating();
      await _loadRelatedSongs();
      await _loadDerivedSongs();
    }
  }

  Future<bool> _loadDetail() async {
    state = state.copyWith(song: const AsyncValue.loading());
    final value =
        await AsyncValue.guard(() => songRepository.fetchSongId(song.id));
    state = state.copyWith(song: value);

    return value.hasError == false;
  }

  Future<void> _loadRating() async {
    if (authRepository.currentUser == null) {
      return;
    }

    final value =
        await AsyncValue.guard(() => authRepository.getRatedSongs(song.id));
    state = state.copyWith(rating: value);
  }

  Future<bool> _loadRelatedSongs() async {
    state = state.copyWith(relatedSongs: const AsyncValue.loading());
    final value =
        await AsyncValue.guard(() => songRepository.fetchSongsRelated(song.id));
    state = state.copyWith(relatedSongs: value);

    return value.hasError == false;
  }

  Future<bool> _loadDerivedSongs() async {
    state = state.copyWith(derivedSongs: const AsyncValue.loading());
    final value =
        await AsyncValue.guard(() => songRepository.fetchSongsDerived(song.id));
    state = state.copyWith(derivedSongs: value);

    return value.hasError == false;
  }

  Future<void> updateRateSong(String value) async {
    if (authRepository.currentUser == null) {
      state = state.copyWith(
          rating: AsyncValue.error(RequireLoginException, StackTrace.current));
      return;
    }
    state = state.copyWith(rating: AsyncValue.data(value));
    await AsyncValue.guard(() => songRepository.rating(song.id, value));
  }

  Future<void> onTapCancelLikeButton() async {
    state = state.copyWith(rating: AsyncValue.data(SongRating.Nothing.name));
    await AsyncValue.guard(
        () => songRepository.rating(song.id, SongRating.Nothing.name));
  }

  Future<void> toggleLyricContent() async {
    state = state.copyWith(showLyricContent: !state.showLyricContent);
  }
}

final songDetailScreenControllerProvider = StateNotifierProvider.autoDispose
    .family<SongDetailScreenController, SongDetailState, int>((ref, id) {
  final songRepository = ref.watch(songRepositoryProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  final controller = SongDetailScreenController(
    songRepository: songRepository,
    authRepository: authRepository,
    song: Song(id: id),
  );

  controller.init();

  return controller;
});

final songRelatedStateProvider =
    StateProvider.autoDispose.family<AsyncValue<SongRelated>, int>((ref, id) {
  final controller = ref.watch(songDetailScreenControllerProvider(id));
  return controller.relatedSongs;
});

final songDerivedStateProvider =
    StateProvider.autoDispose.family<AsyncValue<List<Song>>, int>((ref, id) {
  final controller = ref.watch(songDetailScreenControllerProvider(id));
  return controller.derivedSongs;
});

final ratingSongStateProvider =
    StateProvider.autoDispose.family<AsyncValue<String?>, int>((ref, id) {
  final value = ref.watch(
      songDetailScreenControllerProvider(id).select((value) => value.rating));
  return value;
});
