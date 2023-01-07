import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_state.dart';

class SongDetailScreenController extends StateNotifier<SongDetailState> {
  SongDetailScreenController({
    required this.songRepository,
    required this.song,
  }) : super(SongDetailState(song: AsyncValue.data(song))) {
    loadDetail();
  }

  final SongRepository songRepository;

  final Song song;

  Future<bool> loadDetail() async {
    state = state.copyWith(song: const AsyncValue.loading());
    final value =
        await AsyncValue.guard(() => songRepository.fetchSongId(song.id));
    state = state.copyWith(song: value);

    return value.hasError == false;
  }
}

final songDetailScreenControllerProvider = StateNotifierProvider.autoDispose
    .family<SongDetailScreenController, SongDetailState, int>((ref, id) {
  final songRepository = ref.watch(songRepositoryProvider);

  return SongDetailScreenController(
    songRepository: songRepository,
    song: Song(id: id),
  );
});
