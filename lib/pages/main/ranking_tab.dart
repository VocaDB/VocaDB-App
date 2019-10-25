import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/ranking_bloc.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/pages/youtube_playlist/youtube_playlist_page.dart';
import 'package:vocadb/widgets/center_content.dart';
import 'package:vocadb/widgets/song_tile.dart';

class RankingTab extends StatefulWidget {
  @override
  _RankingTabState createState() => _RankingTabState();
}

class _RankingTabState extends State<RankingTab>
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
    Provider.of<RankingBloc>(context).updateIndex(currentIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  StreamBuilder buildStreamContent(BuildContext context, Stream stream) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return RankingContent(songs: snapshot.data);
        } else if (snapshot.hasError) {
          return CenterResult.error(message: snapshot.error.toString());
        }
        return CenterLoading();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rankingBloc = Provider.of<RankingBloc>(context);

    List<Tab> tabs = [];
    List<StreamBuilder> children = [];

    if (constRankings.contains('daily')) {
      tabs.add(Tab(text: FlutterI18n.translate(context, 'ranking.daily')));
      children.add(buildStreamContent(context, rankingBloc.daily$));
    }

    if (constRankings.contains('weekly')) {
      tabs.add(Tab(text: FlutterI18n.translate(context, 'ranking.weekly')));
      children.add(buildStreamContent(context, rankingBloc.weekly$));
    }

    if (constRankings.contains('monthly')) {
      tabs.add(Tab(text: FlutterI18n.translate(context, 'ranking.monthly')));
      children.add(buildStreamContent(context, rankingBloc.monthly$));
    }

    if (constRankings.contains('overall')) {
      tabs.add(Tab(text: FlutterI18n.translate(context, 'ranking.overall')));
      children.add(buildStreamContent(context, rankingBloc.overall$));
    }

    return SafeArea(
      child: Scaffold(
        appBar: TabBar(
          controller: _tabController,
          tabs: tabs,
          labelColor: theme.textSelectionColor,
          unselectedLabelColor: theme.textTheme.title.color,
        ),
        body: TabBarView(
          controller: _tabController,
          children: children,
        ),
        floatingActionButton: StreamBuilder(
          stream: Provider.of<RankingBloc>(context).currentIndex,
          initialData: 1,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }

            List<SongModel> songs = rankingBloc.currentSongs;

            if (songs == null || songs.isEmpty) {
              return Container();
            }

            return FloatingActionButton(
              onPressed: () => YoutubePlaylistScreen.navigate(context, songs,
                  title: FlutterI18n.translate(context, 'label.ranking')),
              child: Icon(Icons.play_arrow),
            );
          },
        ),
      ),
    );
  }
}

class RankingContent extends StatelessWidget {
  final List<SongModel> songs;

  const RankingContent({Key key, this.songs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (songs == null || songs.isEmpty) {
      return CenterResult.error(
        title: 'No songs found.',
      );
    }

    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        SongModel song = songs[index];
        return SongTile.fromSong(songs[index],
            leading: Text((index + 1).toString()), tag: 'ranking_${song.id}');
      },
    );
  }
}
