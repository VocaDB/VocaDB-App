import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/app_title.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/top_songs_daily_list_view.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/top_songs_monthly_list_view.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/top_songs_overall_list_view.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/top_songs_weekly_list_view.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

// TODO : need implementation
class RankingScreen extends StatelessWidget {
  static const tabDailyKey = Key('tab-daily-key');
  static const tabWeeklyKey = Key('tab-weekly-key');
  static const tabMonthlyKey = Key('tab-monthly-key');
  static const tabOverallKey = Key('tab-overall-key');

  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GlobalAppBar(
          title: const AppTitle(),
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
                Tab(key: tabDailyKey, text: 'Daily'),
                Tab(key: tabWeeklyKey, text: 'Weekly'),
                Tab(key: tabMonthlyKey, text: 'Monthly'),
                Tab(key: tabOverallKey, text: 'Overall'),
              ],
            ),
            body: TabBarView(
              children: [
                TopSongsDailyListView(
                  onSelect: (song) => context.goSong(song.id),
                ),
                TopSongsWeeklyListView(
                  onSelect: (song) => context.goSong(song.id),
                ),
                TopSongsMonthlyListView(
                  onSelect: (song) => context.goSong(song.id),
                ),
                TopSongsOverallListView(
                  onSelect: (song) => context.goSong(song.id),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(AppRoute.playlist.name);
              },
              child: const Icon(Icons.play_arrow),
            ),
          ),
        ),
      ),
    );
  }
}
