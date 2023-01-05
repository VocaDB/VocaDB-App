import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_state.dart';
import 'package:vocadb_app/src/utils/delay.dart';

class SongDetailScreenController extends StateNotifier<SongDetailState> {
  SongDetailScreenController({
    required this.songRepository,
    required this.songId,
  }) : super(SongDetailState(song: Song(id: songId))) {
    _init();
  }

  final SongRepository songRepository;

  final int songId;

  _init() async {
    state = state.copyWith(isLoading: true);
    delay(true);
    final songDetail = await songRepository.fetchSongId(songId);
    state = state.copyWith(song: songDetail, isLoading: false);
  }
}

final songDetailScreenControllerProvider = StateNotifierProvider.family<
    SongDetailScreenController, SongDetailState, int>((ref, id) {
  final songRepository = ref.watch(songRepositoryProvider);

  return SongDetailScreenController(
    songRepository: songRepository,
    songId: id,
  );
});
