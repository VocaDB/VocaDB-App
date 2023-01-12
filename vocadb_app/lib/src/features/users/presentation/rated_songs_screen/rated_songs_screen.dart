import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/common_widgets/search_appbar.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/rated_song.dart';
import 'package:vocadb_app/src/features/users/presentation/rated_songs_screen/rated_songs_state.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';
import 'package:vocadb_app/src/features/users/data/user_repository.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class RatedSongsScreen extends ConsumerWidget {
  const RatedSongsScreen({super.key});

  static const filterKey = Key('icon-filter-key');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(ratedSongsListProvider);

    return Scaffold(
      appBar: SearchAppBar(
        titleText: 'Rated Songs',
        actions: [
          IconButton(
            key: filterKey,
            icon: const Icon(Icons.tune),
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRoute.userRatedSongFilter.name);
            },
          ),
        ],
        onSubmitted: (value) {
          ref
              .read(ratedSongsListParamsStateProvider.notifier)
              .updateQuery(value);
        },
        onCleared: () {
          ref.read(ratedSongsListParamsStateProvider.notifier).clearQuery();
        },
      ),
      body: AsyncValueWidget(
          value: value,
          data: (data) {
            return SongListView(
                songs: data.map((e) => e.song).toList(), onSelect: (s) {});
          }),
    );
  }
}

// State
final ratedSongsListProvider =
    FutureProvider.autoDispose<List<RatedSong>>((ref) {
  final ratedSongsListParams = ref.watch(ratedSongsListParamsStateProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  final authRepository = ref.watch(authRepositoryProvider);

  if (authRepository.currentUser == null) {
    return [];
  }

  return userRepository.fetchRatedSongsList(
    int.parse(authRepository.currentUser!.id),
    ratedSongsListParams,
  );
});
