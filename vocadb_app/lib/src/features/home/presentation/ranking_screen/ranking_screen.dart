import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';
import 'package:vocadb_app/src/features/songs/data/test_songs.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

// TODO : need implementation
class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GlobalAppBar(
          title: 'VocaDB',
          displayHome: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.tune),
              onPressed: () {
                GoRouter.of(context).pushNamed(AppRoute.rankingFilter.name);
              },
            ),
          ],
        ),
        body: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: const TabBar(
              tabs: [
                Tab(text: 'Daily'),
                Tab(text: 'Weekly'),
                Tab(text: 'Monthly'),
                Tab(text: 'Overall'),
              ],
            ),
            body: TabBarView(
              children: [
                SongListView(
                  songs: kTestSongs,
                  displayOrderNumber: true,
                  onSelect: (song) => {},
                ),
                SongListView(
                  songs: kTestSongs,
                  displayOrderNumber: true,
                  onSelect: (song) => {},
                ),
                SongListView(
                  songs: kTestSongs,
                  displayOrderNumber: true,
                  onSelect: (song) => {},
                ),
                SongListView(
                  songs: kTestSongs,
                  displayOrderNumber: true,
                  onSelect: (song) => {},
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => {},
              child: const Icon(Icons.play_arrow),
            ),
          ),
        ),
      ),
    );
  }
}
