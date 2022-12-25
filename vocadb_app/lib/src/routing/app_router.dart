import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_detail_screen.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/authentication/presentation/account/account_screen.dart';
import 'package:vocadb_app/src/features/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/main_screen/main_screen.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_detail_screen/tag_detail_screen.dart';
import 'package:vocadb_app/src/routing/go_router_refresh_stream.dart';

enum AppRoute {
  home,
  songDetail,
  account,
  signIn,
  albumDetail,
  artistDetail,
  tagDetail,
  releaseEventDetail,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      if (isLoggedIn) {
        if (state.location == '/Login') {
          return '/';
        }
      } else {
        if (state.location == '/Profile') {
          return '/';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const MainScreen(),
        routes: [
          GoRoute(
            path: 'S/:id',
            name: AppRoute.songDetail.name,
            builder: (context, state) {
              final songId = state.params['id']!;
              return SongDetailScreen(songId: songId);
            },
          ),
          GoRoute(
            path: 'A/:id',
            name: AppRoute.albumDetail.name,
            builder: (context, state) {
              final albumId = state.params['id']!;
              return AlbumDetailScreen(albumId: albumId);
            },
          ),
          GoRoute(
            path: 'T/:id',
            name: AppRoute.tagDetail.name,
            builder: (context, state) {
              final tagId = state.params['id']!;
              return TagDetailScreen(tagId: tagId);
            },
          ),
          GoRoute(
            path: 'Profile',
            name: AppRoute.account.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const AccountScreen(),
            ),
          ),
          GoRoute(
            path: 'Login',
            name: AppRoute.signIn.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const SignInScreen(),
            ),
          ),
        ],
      ),
    ],
  );
});
