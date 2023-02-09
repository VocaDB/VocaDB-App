import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/common_widgets/search_appbar.dart';
import 'package:vocadb_app/src/features/artists/domain/followed_artist.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_list_view.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/users/data/user_repository.dart';
import 'package:vocadb_app/src/features/users/presentation/followed_artists_screen/followed_artists_list_params_state.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class FollowedArtistsScreen extends ConsumerWidget {
  const FollowedArtistsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(followedArtistsListProvider);

    return Scaffold(
      appBar: SearchAppBar(
        titleText: 'Followed artists',
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              GoRouter.of(context)
                  .goNamed(AppRoute.userFollowedArtistsFilter.name);
            },
          ),
        ],
        onSubmitted: (value) {
          ref
              .read(followedArtistsListParamsStateProvider.notifier)
              .updateQuery(value);
        },
        onCleared: () {
          ref
              .read(followedArtistsListParamsStateProvider.notifier)
              .clearQuery();
        },
      ),
      body: AsyncValueWidget(
          value: value,
          data: (data) {
            if (data.isEmpty) {
              return const Center(
                child: Text('Not found'),
              );
            }

            return ArtistListView(
              artists: data.map((e) => e.artist).toList(),
              onSelect: context.goArtistDetail,
            );
          }),
    );
  }
}

final followedArtistsListProvider =
    FutureProvider.autoDispose<List<FollowedArtist>>((ref) {
  final followedArtistsListParams =
      ref.watch(followedArtistsListParamsStateProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  final authRepository = ref.watch(authRepositoryProvider);

  if (authRepository.currentUser == null) {
    return [];
  }

  return userRepository.fetchFollowedArtistsList(
    authRepository.currentUser!.id,
    followedArtistsListParams,
  );
});
