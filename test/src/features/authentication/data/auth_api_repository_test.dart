import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/domain/album_collection.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_api_repository.dart';
import 'package:vocadb_app/src/features/authentication/domain/app_user.dart';

import '../../../mocks.dart';

void main() {
  late ApiClient apiClient;
  late AuthApiRepository authRepository;

  setUp(() {
    apiClient = MockApiClient();
    authRepository = AuthApiRepository(apiClient: apiClient);
  });

  group('authApiRepository.login', () {
    test('success', () async {
      callLogin() => apiClient.login('user', 'pass');
      when(callLogin).thenAnswer((_) => Future.value());

      callGetCurrentUser() => apiClient.authGet(
            '/api/users/current',
            params: {'fields': 'MainPicture'},
          );
      when(callGetCurrentUser)
          .thenAnswer((_) => Future.value({'id': 1065, 'name': 'up2up'}));

      expectLater(
        authRepository.authStateChanges(),
        emitsInOrder(const [
          null,
          AppUser(id: 1065, name: 'up2up'),
        ]),
      );

      await authRepository.signIn('user', 'pass');

      verify(callLogin).called(1);
      verify(callGetCurrentUser).called(1);
    });

    test('login error', () async {
      callLogin() => apiClient.login('user', 'pass');
      when(callLogin).thenThrow(const HttpException('Error'));

      try {
        await authRepository.signIn('user', 'pass');
        fail('exception not thrown');
      } catch (e) {
        expect(e, isA<HttpException>());
        verify(callLogin).called(1);
        verifyNever(() => apiClient.authGet(
              '/api/users/current',
              params: {'fields': 'MainPicture'},
            ));
      }
    });
    test('get current user error', () async {
      callLogin() => apiClient.login('user', 'pass');
      when(callLogin).thenAnswer((_) => Future.value());

      callGetCurrentUser() => apiClient.authGet('/api/users/current', params: {
            'fields': 'MainPicture',
          });
      when(callGetCurrentUser).thenThrow(const HttpException("Error"));

      try {
        await authRepository.signIn('user', 'pass');
        fail('exception not thrown');
      } catch (e) {
        expect(e, isA<HttpException>());
        verify(callLogin).called(1);
        verify(callGetCurrentUser).called(1);
      }
    });
  });

  group('authApiRepository.logout', () {
    test('success', () async {
      callLogout() => apiClient.logout();
      when(callLogout).thenAnswer((_) => Future.value());

      await authRepository.signOut();

      verify(callLogout).called(1);
    });
  });

  group('authApiRepository.getAlbumCollectionStatus', () {
    test('success with collected album', () async {
      const albumId = 1;

      when(() => apiClient
              .authGet('/api/users/current/album-collection-statuses/1'))
          .thenAnswer((_) => Future.value({
                'rating': 5,
                'purchaseStatus': 'Wishlisted',
                'mediaType': 'Other',
                'album': {'id': 1, 'name': 'Album_A'}
              }));

      final result = await authRepository.getAlbumCollection(albumId);

      expect(
        result,
        AlbumCollection(
          mediaType: 'Other',
          purchaseStatus: 'Wishlisted',
          rating: 5,
          album: Album(id: 1, name: 'Album_A'),
        ),
      );
    });

    test('success with uncollected album', () async {
      const albumId = 1;

      when(() => apiClient
              .authGet('/api/users/current/album-collection-statuses/1'))
          .thenAnswer((_) => Future.value({'rating': 0}));

      final result = await authRepository.getAlbumCollection(albumId);

      expect(
        result,
        const AlbumCollection(
          rating: 0,
        ),
      );
    });
  });
}