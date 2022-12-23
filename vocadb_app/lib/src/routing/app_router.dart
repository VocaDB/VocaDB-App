import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/features/authentication/presentation/account/account_screen.dart';
import 'package:vocadb_app/src/features/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/home_screen/home_screen.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen.dart';

enum AppRoute { home, songDetail, account, signIn }

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const HomeScreen(),
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
