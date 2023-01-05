import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class TopSongsWeeklyListView extends ConsumerWidget {
  const TopSongsWeeklyListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(songsWeeklyProvider);
    return AsyncValueWidget(
      value: value,
      data: (data) => SongListView(
        songs: data,
        displayOrderNumber: true,
        onSelect: (song) {
          GoRouter.of(context).pushNamed(
            AppRoute.songDetail.name,
            params: {
              'id': song.id.toString(),
            },
          );
        },
      ),
    );
  }
}
