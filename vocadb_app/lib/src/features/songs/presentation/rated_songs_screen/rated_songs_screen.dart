import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/search_appbar.dart';
import 'package:vocadb_app/src/features/songs/data/fake_rated_songs_list.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

// TODO : need implementation
class RatedSongsScreen extends StatelessWidget {
  const RatedSongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ratedSongs = kFakeRatedSongsList;

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
      body: SongListView(
        songs: ratedSongs.map((e) => e.song).toList(),
        onSelect: (s) {},
      ),
    );
  }
}
