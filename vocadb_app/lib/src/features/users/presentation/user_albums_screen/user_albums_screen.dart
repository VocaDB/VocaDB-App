import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/common_widgets/search_appbar.dart';
import 'package:vocadb_app/src/features/albums/domain/album_collection.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/album_list_view.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/users/data/user_repository.dart';
import 'package:vocadb_app/src/features/users/presentation/user_albums_screen/user_albums_list_params_state.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class UserAlbumsScreen extends ConsumerWidget {
  const UserAlbumsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(userAlbumsListProvider);

    return Scaffold(
      appBar: SearchAppBar(
        titleText: 'My Collections',
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              GoRouter.of(context).goNamed(AppRoute.userAlbumsFilter.name);
            },
          ),
        ],
        onSubmitted: (value) {
          ref
              .read(userAlbumsListParamsStateProvider.notifier)
              .updateQuery(value);
        },
        onCleared: () {
          ref.read(userAlbumsListParamsStateProvider.notifier).clearQuery();
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

            return AlbumListView(
              albums: data.map((e) => e.album).toList(),
              onSelect: context.goAlbumDetail,
            );
          }),
    );
  }
}

final userAlbumsListProvider =
    FutureProvider.autoDispose<List<AlbumCollection>>((ref) {
  final userAlbumsListParams = ref.watch(userAlbumsListParamsStateProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  final authRepository = ref.watch(authRepositoryProvider);

  if (authRepository.currentUser == null) {
    return [];
  }

  return userRepository.fetchAlbums(
    authRepository.currentUser!.id,
    userAlbumsListParams,
  );
});
