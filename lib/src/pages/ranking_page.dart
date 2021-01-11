import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
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

  void _onTabSong(SongModel song) => AppPages.toSongDetailPage(song);

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
      tabs.add(Tab(text: 'ranking.daily'.tr));
    }

    if (constRankings.contains('weekly')) {
      tabs.add(Tab(text: 'ranking.weekly'.tr));
    }

    if (constRankings.contains('monthly')) {
      tabs.add(Tab(text: 'ranking.monthly'.tr));
    }

    if (constRankings.contains('overall')) {
      tabs.add(Tab(text: 'ranking.overall'.tr));
    }

    return tabs;
  }

  List<Widget> _generateRankingContent() {
    List<Widget> contents = [];

    if (constRankings.contains('daily')) {
      contents.add(Obx(() => SongListView(
            songs: _rankingController.daily.toList(),
            onSelect: (s) => this._onTabSong(s),
          )));
    }

    if (constRankings.contains('weekly')) {
      contents.add(Obx(() => SongListView(
            songs: _rankingController.weekly.toList(),
            onSelect: (s) => this._onTabSong(s),
          )));
    }

    if (constRankings.contains('monthly')) {
      contents.add(Obx(() => SongListView(
            songs: _rankingController.monthly.toList(),
            onSelect: (s) => this._onTabSong(s),
          )));
    }

    if (constRankings.contains('overall')) {
      contents.add(Obx(() => SongListView(
            songs: _rankingController.overall.toList(),
            onSelect: (s) => this._onTabSong(s),
          )));
    }

    return contents;
  }

  _onTapPlaylist() {
    int currentIndex = _tabController.index;

    String selected = constRankings[currentIndex];

    List<SongModel> songs = [];
    String title = ' Playlist';
    switch (selected) {
      case 'daily':
        title = 'ranking.daily'.tr;
        songs = _rankingController.daily();
        break;
      case 'weekly':
        title = 'ranking.weekly'.tr;
        songs = _rankingController.weekly();
        break;
      case 'monthly':
        title = 'ranking.monthly'.tr;
        songs = _rankingController.monthly();
        break;
      case 'overall':
        title = 'ranking.overall'.tr;
        songs = _rankingController.overall();
        break;
    }

    if (songs.isNotEmpty) {
      AppPages.openPVPlayListPage(songs, title: title);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          appBar: TabBar(
            controller: _tabController,
            tabs: _generateTabs(),
            labelColor: theme.textSelectionColor,
            unselectedLabelColor: theme.textTheme.headline6.color,
          ),
          body: TabBarView(
            controller: _tabController,
            children: _generateRankingContent(),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () => this._onTapPlaylist(),
              child: Icon(Icons.play_arrow))),
    );
  }
}
