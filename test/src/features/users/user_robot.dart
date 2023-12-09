import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';
import 'package:vocadb_app/src/features/users/data/user_repository.dart';
import 'package:vocadb_app/src/features/users/presentation/followed_artists_screen/followed_artists_screen.dart';
import 'package:vocadb_app/src/features/users/presentation/user_albums_screen/user_albums_filter_screen.dart';
import 'package:vocadb_app/src/features/users/presentation/user_albums_screen/user_albums_screen.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class UserRobot {
  final WidgetTester tester;

  UserRobot(this.tester);

  Future<void> pumpUserAlbumsListScreen({
    UserRepository? userRepository,
    AuthRepository? authRepository,
    UserSettingsRepository? userSettingsRepository,
  }) async {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const UserAlbumsScreen(),
          routes: [
            GoRoute(
              path: 'filter',
              name: AppRoute.userAlbumsFilter.name,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                fullscreenDialog: true,
                child: const UserAlbumsFilterScreen(),
              ),
            ),
          ],
        ),
      ],
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (userRepository != null)
            userRepositoryProvider.overrideWithValue(userRepository),
          if (authRepository != null)
            authRepositoryProvider.overrideWithValue(authRepository),
          if (userSettingsRepository != null)
            userSettingsRepositoryProvider
                .overrideWithValue(userSettingsRepository),
        ],
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );
    // await tester.pumpAndSettle(const Duration(seconds: 10));
    await tester.pump();
  }

  Future<void> pumpFollowedArtistsScreen({
    UserRepository? userRepository,
    AuthRepository? authRepository,
    UserSettingsRepository? userSettingsRepository,
  }) async {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const FollowedArtistsScreen(),
          routes: [
            GoRoute(
              path: 'filter',
              name: AppRoute.userFollowedArtistsFilter.name,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                fullscreenDialog: true,
                child: const FollowedArtistsScreen(),
              ),
            ),
          ],
        ),
      ],
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (userRepository != null)
            userRepositoryProvider.overrideWithValue(userRepository),
          if (authRepository != null)
            authRepositoryProvider.overrideWithValue(authRepository),
          if (userSettingsRepository != null)
            userSettingsRepositoryProvider
                .overrideWithValue(userSettingsRepository),
        ],
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );
    // await tester.pumpAndSettle(const Duration(seconds: 10));
    await tester.pump();
  }
}
