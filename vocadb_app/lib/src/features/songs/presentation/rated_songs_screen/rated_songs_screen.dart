import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/common_widgets/search_appbar.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';
import 'package:vocadb_app/src/features/users/data/user_repository.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class RatedSongsScreen extends StatelessWidget {
  const RatedSongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        titleText: 'Rated Songs',
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              GoRouter.of(context).goNamed(AppRoute.userRatedSongFilter.name);
            },
          ),
        ],
      ),
      body: Consumer(builder: ((context, ref, child) {
        final value = ref.watch(currentUserRatedSongsListProvider);

        return AsyncValueWidget(
            value: value,
            data: (data) {
              return SongListView(
                songs: data.map((e) => e.song).toList(),
                onSelect: (s) {},
              );
            });
      })),
    );
  }
}
