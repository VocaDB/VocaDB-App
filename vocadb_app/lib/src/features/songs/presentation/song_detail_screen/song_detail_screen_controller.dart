import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/domain/song_related.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_state.dart';

class SongDetailScreenController extends StateNotifier<SongDetailState> {
  SongDetailScreenController({
    required this.songRepository,
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

  final Song song;

  /// Load song detail first, if success then load related song next.
  Future<void> init() async {
    final isSuccess = await _loadDetail();
    if (isSuccess) {
      await _loadRelatedSongs();
    }
  }

  Future<bool> _loadDetail() async {
    state = state.copyWith(song: const AsyncValue.loading());
    final value =
        await AsyncValue.guard(() => songRepository.fetchSongId(song.id));
    state = state.copyWith(song: value);

    return value.hasError == false;
  }

  Future<bool> _loadRelatedSongs() async {
    state = state.copyWith(relatedSongs: const AsyncValue.loading());
    final value =
        await AsyncValue.guard(() => songRepository.fetchSongsRelated(song.id));
    state = state.copyWith(relatedSongs: value);

    return value.hasError == false;
  }
}

final songDetailScreenControllerProvider = StateNotifierProvider.autoDispose
    .family<SongDetailScreenController, SongDetailState, int>((ref, id) {
  final songRepository = ref.watch(songRepositoryProvider);
  final controller = SongDetailScreenController(
    songRepository: songRepository,
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
