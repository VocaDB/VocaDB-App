import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/ranking_bloc.dart';
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
  final List<Tab> myTabs = <Tab>[
    Tab(text: "Daily"),
    Tab(text: "Weekly"),
    Tab(text: "Monthly"),
    Tab(text: "Overall")
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4, initialIndex: 1);
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rankingBloc = Provider.of<RankingBloc>(context);

    return SafeArea(
      child: Scaffold(
        appBar: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: FlutterI18n.translate(context, 'ranking.daily')),
            Tab(text: FlutterI18n.translate(context, 'ranking.weekly')),
            Tab(text: FlutterI18n.translate(context, 'ranking.monthly')),
            Tab(text: FlutterI18n.translate(context, 'ranking.overall'))
          ],
          labelColor: theme.textSelectionColor,
          unselectedLabelColor: theme.textTheme.title.color,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            StreamBuilder(
              stream: rankingBloc.daily$,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return RankingContent(songs: snapshot.data);
                } else if (snapshot.hasError) {
                  return CenterResult.error(message: snapshot.error.toString());
                }
                return CenterLoading();
              },
            ),
            StreamBuilder(
              stream: rankingBloc.weekly$,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return RankingContent(songs: snapshot.data);
                } else if (snapshot.hasError) {
                  return CenterResult.error(message: snapshot.error.toString());
                }
                return CenterLoading();
              },
            ),
            StreamBuilder(
              stream: rankingBloc.monthly$,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return RankingContent(songs: snapshot.data);
                } else if (snapshot.hasError) {
                  return CenterResult.error(message: snapshot.error.toString());
                }
                return CenterLoading();
              },
            ),
            StreamBuilder(
              stream: rankingBloc.overall$,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return RankingContent(songs: snapshot.data);
                } else if (snapshot.hasError) {
                  return CenterResult.error(message: snapshot.error.toString());
                }
                return CenterLoading();
              },
            ),
          ],
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
