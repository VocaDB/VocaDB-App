import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/albums/data/album_repository.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/home/presentation/main_screen/main_screen_state.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_repository.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

class MainScreenController extends StateNotifier<MainScreenState> {
  final ReleaseEventRepository releaseEventRepository;
  final SongRepository songRepository;
  final AlbumRepository albumRepository;

  MainScreenController({
    required this.releaseEventRepository,
    required this.songRepository,
    required this.albumRepository,
  }) : super(MainScreenState());

  Future<void> fetchRecentEvents() async {
    if (state.recentEvents == null) {
      state = state.copyWith(recentEvents: const AsyncValue.loading());
      final value = await AsyncValue.guard(
          () => releaseEventRepository.fetchRecentEvents());
      state = state.copyWith(recentEvents: value);
    }
  }

  Future<void> fetchHighlightedSongs() async {
    if (state.highlightedSongs == null) {
      state = state.copyWith(highlightedSongs: const AsyncValue.loading());
      final value =
          await AsyncValue.guard(() => songRepository.fetchSongsHighlighted());
      state = state.copyWith(highlightedSongs: value);
    }
  }

  Future<void> fetchNewAlbums() async {
    if (state.newAlbums == null) {
      state = state.copyWith(newAlbums: const AsyncValue.loading());
      final value = await AsyncValue.guard(() => albumRepository.fetchNew());
      state = state.copyWith(newAlbums: value);
    }
  }

  Future<void> fetchTopAlbums() async {
    if (state.topAlbums == null) {
      state = state.copyWith(topAlbums: const AsyncValue.loading());
      final value = await AsyncValue.guard(() => albumRepository.fetchTop());
      state = state.copyWith(topAlbums: value);
    }
  }

  Future<void> updateTabIndex(int value) async =>
      state = state.copyWith(tabIndex: value);
}

final mainScreenControllerProvider =
    StateNotifierProvider.autoDispose<MainScreenController, MainScreenState>(
        (ref) {
  final releaseEventRepository = ref.watch(releaseEventRepositoryProvider);
  final songRepository = ref.watch(songRepositoryProvider);
  final albumRepository = ref.watch(albumRepositoryProvider);

  final controller = MainScreenController(
    releaseEventRepository: releaseEventRepository,
    songRepository: songRepository,
    albumRepository: albumRepository,
  );

  controller.fetchHighlightedSongs();
  controller.fetchNewAlbums();
  controller.fetchTopAlbums();
  controller.fetchRecentEvents();

  return controller;
});

final mainScreenTabIndexStateProvider = StateProvider.autoDispose<int>((ref) {
  final mainScreenController = ref.watch(mainScreenControllerProvider);
  return mainScreenController.tabIndex;
});

final mainScreenRecentEventsProvider =
    StateProvider.autoDispose<AsyncValue<List<ReleaseEvent>>?>((ref) {
  final mainScreenController = ref.watch(mainScreenControllerProvider);
  return mainScreenController.recentEvents;
});

final mainScreenHighlightedSongsProvider =
    StateProvider.autoDispose<AsyncValue<List<Song>>?>((ref) {
  final mainScreenController = ref.watch(mainScreenControllerProvider);
  return mainScreenController.highlightedSongs;
});

final mainScreenTopAlbumsProvider =
    StateProvider.autoDispose<AsyncValue<List<Album>>?>((ref) {
  final mainScreenController = ref.watch(mainScreenControllerProvider);
  return mainScreenController.topAlbums;
});

final mainScreenNewAlbumsProvider =
    StateProvider.autoDispose<AsyncValue<List<Album>>?>((ref) {
  final mainScreenController = ref.watch(mainScreenControllerProvider);
  return mainScreenController.newAlbums;
});
