import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/widgets.dart';

class RankingPage extends StatefulWidget {
  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  RankingController _rankingController;

  @override
  void initState() {
    super.initState();
    _rankingController = Get.find<RankingController>();
    _tabController = TabController(
        vsync: this, length: constRankings.length, initialIndex: 1);
    _tabController.addListener(onTabChanged);
  }

  void _onTabSong(SongModel song, String prefixHeroTag) =>
      AppPages.toSongDetailPage(song, prefixHeroTag: prefixHeroTag);

  void onTabChanged() {
    int currentIndex = _tabController.index;
    // Provider.of<RankingBloc>(context).updateIndex(currentIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Tab> _generateTabs() {
    List<Tab> tabs = [];

    if (constRankings.contains('daily')) {
      tabs.add(Tab(text: 'Daily'));
    }

    if (constRankings.contains('weekly')) {
      tabs.add(Tab(text: 'Weekly'));
    }

    if (constRankings.contains('monthly')) {
      tabs.add(Tab(text: 'Monthly'));
    }

    if (constRankings.contains('overall')) {
      tabs.add(Tab(text: 'Overall'));
    }

    return tabs;
  }

  List<Widget> _generateRankingContent() {
    List<Widget> contents = [];

    if (constRankings.contains('daily')) {
      contents.add(Obx(() => SongListView(
            songs: _rankingController.daily.toList(),
            onSelect: (s) => this._onTabSong(s, 'daily'),
            prefixHeroTag: 'daily',
          )));
    }

    if (constRankings.contains('weekly')) {
      contents.add(Obx(() => SongListView(
            songs: _rankingController.weekly.toList(),
            onSelect: (s) => this._onTabSong(s, 'weekly'),
            prefixHeroTag: 'weekly',
          )));
    }

    if (constRankings.contains('monthly')) {
      contents.add(Obx(() => SongListView(
            songs: _rankingController.monthly.toList(),
            onSelect: (s) => this._onTabSong(s, 'monthly'),
            prefixHeroTag: 'monthly',
          )));
    }

    if (constRankings.contains('overall')) {
      contents.add(Obx(() => SongListView(
            songs: _rankingController.overall.toList(),
            onSelect: (s) => this._onTabSong(s, 'overall'),
            prefixHeroTag: 'overall',
          )));
    }

    return contents;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: TabBar(
            controller: _tabController,
            tabs: _generateTabs(),
          ),
          body: TabBarView(
            controller: _tabController,
            children: _generateRankingContent(),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () => Get.to(PVPlaylistPage()),
              child: Icon(Icons.play_arrow))),
    );
  }
}
