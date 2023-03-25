import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/albums/data/album_repository.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/domain/album_collection.dart';
import 'package:vocadb_app/src/features/albums/domain/album_rate.dart';
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
    AlbumCollection? albumCollection,
  }) : super(AlbumDetailState(
          album: AsyncValue.data(album),
          albumCollection: albumCollection,
        ));

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

  Future<void> updateRating(int rating) async {
    final newStatus = state.albumCollection?.copyWith(rating: rating);
    state = state.copyWith(albumCollection: newStatus);
  }

  Future<void> updatePurchaseStatus(String purchaseStatus) async {
    final newStatus =
        state.albumCollection?.copyWith(purchaseStatus: purchaseStatus);
    state = state.copyWith(albumCollection: newStatus);
  }

  Future<void> updateMediaType(String mediaType) async {
    final newStatus = state.albumCollection?.copyWith(mediaType: mediaType);
    state = state.copyWith(albumCollection: newStatus);
  }

  Future<void> submitUpdateStatus() async {
    if (state.albumCollection == null) {
      return;
    }

    final currentStatus = state.albumCollection!;
    final albumRate = AlbumRate(
        rating: currentStatus.rating,
        collectionStatus: currentStatus.purchaseStatus!,
        mediaType: currentStatus.mediaType!);
    await albumRepository.rateAlbum(album.id, albumRate);
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
