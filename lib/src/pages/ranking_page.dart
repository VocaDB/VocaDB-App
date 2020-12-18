import 'package:flutter/material.dart';
import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

class RankingPage extends StatefulWidget {
  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this, length: constRankings.length, initialIndex: 1);
    _tabController.addListener(onTabChanged);
  }

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
    return [
      SongListView(
        songs: [
          SongModel(
              name: 'spirit photo',
              artistString: 'Kirishima feat. Hatsune Miku',
              songType: 'Original',
              thumbUrl: 'https://i.ytimg.com/vi/6OAd30ljny8/default.jpg'),
          SongModel(
              name: '冥路',
              artistString: '猶。 feat. 蝶尾チイ',
              songType: 'Original',
              thumbUrl:
                  'https://nicovideo.cdn.nimg.jp/thumbnails/37100042/37100042.48402854'),
          SongModel(
              name: 'ナガレボシ',
              artistString: 'Linmu feat. Hatsune Miku',
              songType: 'Original',
              thumbUrl:
                  'https://nicovideo.cdn.nimg.jp/thumbnails/37958478/37958478.81870418')
        ],
      ),
      SongListView(
        songs: [
          SongModel(
              name: 'spirit photo',
              artistString: 'Linmu feat. Hatsune Miku',
              songType: 'Original',
              thumbUrl: 'https://i.ytimg.com/vi/6OAd30ljny8/default.jpg')
        ],
      ),
      SongListView(
        songs: [
          SongModel(
              name: 'spirit photo',
              artistString: 'Kirishima feat. Hatsune Miku',
              songType: 'Original',
              thumbUrl: 'https://i.ytimg.com/vi/6OAd30ljny8/default.jpg')
        ],
      ),
      SongListView(
        songs: [
          SongModel(
              name: 'spirit photo',
              artistString: 'Kirishima feat. Hatsune Miku',
              songType: 'Original',
              thumbUrl: 'https://i.ytimg.com/vi/6OAd30ljny8/default.jpg')
        ],
      ),
    ];
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
              onPressed: () => {}, child: Icon(Icons.play_arrow))),
    );
  }
}
