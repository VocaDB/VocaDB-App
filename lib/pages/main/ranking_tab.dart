import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/ranking_bloc.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/pages/youtube_playlist/youtube_playlist_page.dart';
import 'package:vocadb/widgets/result.dart';
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
    _tabController =
        TabController(vsync: this, length: myTabs.length, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void openPlaylist(List<SongModel> songs) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => YoutubePlaylistPage(songs: songs)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rankingBloc = Provider.of<RankingBloc>(context);

    return SafeArea(
        child: Scaffold(
            appBar: TabBar(
              controller: _tabController,
              tabs: myTabs,
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
                      return CenterError(message: snapshot.error.toString());
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
                      return CenterError(message: snapshot.error.toString());
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
                      return CenterError(message: snapshot.error.toString());
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
                      return CenterError(message: snapshot.error.toString());
                    }
                    return CenterLoading();
                  },
                ),
              ],
            )));
  }
}

class CenterError extends StatelessWidget {
  final String message;

  const CenterError({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Result.error('Something wrong!', subtitle: message),
    );
  }
}

class CenterLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class RankingContent extends StatelessWidget {
  final List<SongModel> songs;

  const RankingContent({Key key, this.songs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        (songs == null || songs.length == 0)
            ? Container()
            : FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              YoutubePlaylistPage(songs: songs)));
                },
                child: Row(
                  children: <Widget>[Icon(Icons.play_arrow), Text('Play all')],
                ),
              ),
        Expanded(
          child: ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              SongModel song = songs[index];
              return SongTile.fromEntry(songs[index],
                  leading: Text((index + 1).toString()),
                  tag: 'ranking_${song.id}');
            },
          ),
        ),
      ],
    );
  }
}
