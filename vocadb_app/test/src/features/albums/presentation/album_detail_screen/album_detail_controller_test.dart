import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/albums/data/album_repository.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/domain/album_collection.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_detail_controller.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_detail_state.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/authentication/domain/app_user.dart';

import '../../../../mocks.dart';

void main() {
  group('album_detail_screen_controller', () {
    late AlbumRepository albumRepository;
    late AuthRepository authRepository;
    late AlbumDetailController controller;

    setUp(() {
      albumRepository = MockAlbumRepository();
      authRepository = MockAuthRepository();
    });

    test('init without user logged in', () async {
      final album = Album(id: 1, name: 'Album_A');

      controller = AlbumDetailController(
        albumRepository: albumRepository,
        authRepository: authRepository,
        album: album,
      );

      when(() => albumRepository.fetchAlbumID(1))
          .thenAnswer((invocation) => Future.value(album));

      expectLater(
        controller.stream,
        emitsInOrder([
          // fetchAlbumID loading
          const AlbumDetailState(
            album: AsyncValue.loading(),
          ),

          // fetchAlbumID success
          AlbumDetailState(
            album: AsyncValue.data(album),
          ),
          emitsDone
        ]),
      );

      await controller.init();

      controller.dispose();

      verify(() => albumRepository.fetchAlbumID(1)).called(1);
      verifyNever(() => authRepository.getAlbumCollection(album.id));
    });

    test('init with user logged in', () async {
      final album = Album(id: 1, name: 'Album_A');

      controller = AlbumDetailController(
        albumRepository: albumRepository,
        authRepository: authRepository,
        album: album,
      );

      const albumCollection = AlbumCollection(
          rating: 4, purchaseStatus: 'Ordered', mediaType: 'Other');
      when(() => albumRepository.fetchAlbumID(1))
          .thenAnswer((invocation) => Future.value(album));

      when(() => authRepository.currentUser)
          .thenReturn(const AppUser(id: 1, name: 'up2up'));

      when(() => authRepository.getAlbumCollection(1))
          .thenAnswer((invocation) => Future.value(albumCollection));

      expectLater(
        controller.stream,
        emitsInOrder([
          // fetchAlbumID loading
          const AlbumDetailState(
            album: AsyncValue.loading(),
          ),

          // fetchAlbumID success
          AlbumDetailState(
            album: AsyncValue.data(album),
          ),

          // fetch album collection status success
          AlbumDetailState(
            album: AsyncValue.data(album),
            albumCollection: albumCollection,
          ),
          emitsDone
        ]),
      );

      await controller.init();

      controller.dispose();

      verify(() => albumRepository.fetchAlbumID(1)).called(1);
      verify(() => authRepository.getAlbumCollection(album.id)).called(1);
    });

    test('update rating success', () async {
      final album = Album(id: 1, name: 'Album_A');
      const albumCollection = AlbumCollection(
          rating: 4, purchaseStatus: 'Ordered', mediaType: 'Other');

      controller = AlbumDetailController(
        albumRepository: albumRepository,
        authRepository: authRepository,
        album: album,
        albumCollection: albumCollection,
      );

      expectLater(
        controller.stream,
        emitsInOrder([
          AlbumDetailState(
            album: AsyncValue.data(album),
            albumCollection: albumCollection.copyWith(rating: 5),
          ),
          emitsDone
        ]),
      );

      await controller.updateRating(5);

      controller.dispose();
    });

    test('update purchase status success', () async {
      final album = Album(id: 1, name: 'Album_A');
      const albumCollection = AlbumCollection(
          rating: 4, purchaseStatus: 'Ordered', mediaType: 'Other');

      controller = AlbumDetailController(
        albumRepository: albumRepository,
        authRepository: authRepository,
        album: album,
        albumCollection: albumCollection,
      );

      expectLater(
        controller.stream,
        emitsInOrder([
          AlbumDetailState(
            album: AsyncValue.data(album),
            albumCollection:
                albumCollection.copyWith(purchaseStatus: 'Wishlisted'),
          ),
          emitsDone
        ]),
      );

      await controller.updatePurchaseStatus('Wishlisted');

      controller.dispose();
    });

    test('update media type success', () async {
      final album = Album(id: 1, name: 'Album_A');
      const albumCollection = AlbumCollection(
          rating: 4, purchaseStatus: 'Ordered', mediaType: 'Other');

      controller = AlbumDetailController(
        albumRepository: albumRepository,
        authRepository: authRepository,
        album: album,
        albumCollection: albumCollection,
      );

      expectLater(
        controller.stream,
        emitsInOrder([
          AlbumDetailState(
            album: AsyncValue.data(album),
            albumCollection: albumCollection.copyWith(mediaType: 'Digital'),
          ),
          emitsDone
        ]),
      );

      await controller.updateMediaType('Digital');

      controller.dispose();
    });
  });
}
