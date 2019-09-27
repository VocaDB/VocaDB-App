import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/ranking_bloc.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/pages/song_detail/song_detail_page.dart';
import 'package:vocadb/pages/youtube_playlist/youtube_playlist_page.dart';
import 'package:vocadb/widgets/result.dart';

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
                    if(snapshot.hasData) {
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
                    if(snapshot.hasData) {
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
                    if(snapshot.hasData) {
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
                    if(snapshot.hasData) {
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
        (songs == null || songs.length == 0)? Container() : FlatButton(
          onPressed: () {
             Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => YoutubePlaylistPage(songs: songs)));
          },
          child: Row(
            children: <Widget>[Icon(Icons.play_arrow), Text('Play all')],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              return RankingTile.fromSong((index + 1).toString(), songs[index]);
            },
          ),
        ),
      ],
    );
  }
}

class RankingTile extends StatelessWidget {
  final int id;
  final String rankNumber;
  final String name;
  final String artist;
  final String thumbUrl;

  const RankingTile(
      {Key key,
      this.rankNumber,
      this.id,
      this.name,
      this.artist,
      this.thumbUrl})
      : super(key: key);

  RankingTile.fromSong(this.rankNumber, SongModel song)
      : this.id = song.id,
        this.name = song.name,
        this.artist = song.artistString,
        this.thumbUrl = song.thumbUrl;

  Widget rankNumberWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(this.rankNumber),
    );
  }

  Widget thumbnailWidget() {
    Widget thumbnail = (this.thumbUrl != null && this.thumbUrl.isNotEmpty)
        ? CachedNetworkImage(
            imageUrl: this.thumbUrl,
            placeholder: (context, url) => Container(color: Colors.grey),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          )
        : Placeholder();

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 120,
          child: thumbnail,
        ));
  }

  Widget infoWidget(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(this.name, overflow: TextOverflow.ellipsis),
            Text(this.artist,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.caption),
          ],
        ),
      ),
    );
  }

  Widget trailing() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SongDetailPage(
                    this.id, this.name, this.thumbUrl,
                    tag: 'ranking_$id')));
      },
      child: Container(
        height: 100,
        child: Row(
          children: <Widget>[
            rankNumberWidget(),
            thumbnailWidget(),
            infoWidget(context),
          ],
        ),
      ),
    );
  }
}
