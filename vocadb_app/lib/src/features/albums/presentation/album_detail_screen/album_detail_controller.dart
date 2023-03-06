import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/albums/data/album_repository.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_detail_state.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';

class AlbumDetailController extends StateNotifier<AlbumDetailState> {
  final AlbumRepository albumRepository;

  final AuthRepository authRepository;

  final Album album;

  AlbumDetailController({
    required this.albumRepository,
    required this.authRepository,
    required this.album,
  }) : super(AlbumDetailState(album: AsyncValue.data(album)));

  Future<void> init() async {
    await _loadDetail();
    await _loadAlbumCollectionStatuses();
  }

  Future<void> _loadAlbumCollectionStatuses() async {
    if (authRepository.currentUser == null) {
      return;
    }

    final value = await authRepository.getAlbumCollection(album.id);
    state = state.copyWith(albumCollection: value);
  }

  Future<void> _loadDetail() async {
    state = state.copyWith(album: const AsyncValue.loading());
    final value =
        await AsyncValue.guard(() => albumRepository.fetchAlbumID(album.id));
    state = state.copyWith(album: value);
  }
}

final albumDetailControllerProvider = StateNotifierProvider.autoDispose
    .family<AlbumDetailController, AlbumDetailState, int>((ref, id) {
  final albumRepository = ref.watch(albumRepositoryProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  final controller = AlbumDetailController(
    albumRepository: albumRepository,
    authRepository: authRepository,
    album: Album(id: id),
  );

  controller.init();

  return controller;
});
