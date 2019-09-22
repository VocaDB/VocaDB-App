import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/pages/song_detail/song_detail_page.dart';
import 'package:vocadb/services/web_service.dart';
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: TabBar(
              controller: _tabController,
              tabs: myTabs,
              labelColor: theme.primaryColor,
              unselectedLabelColor: theme.textTheme.title.color,
            ),
            body: TabBarView(
              controller: _tabController,
              children: [
                RankingContent(rankDuration: RankDuration.DAILY),
                RankingContent(rankDuration: RankDuration.WEEKLY),
                RankingContent(rankDuration: RankDuration.MONTHLY),
                RankingContent(rankDuration: RankDuration.OVERALL),
              ],
            )));
  }
}

class RankingContent extends StatelessWidget {
  final int rankDuration;

  const RankingContent({Key key, this.rankDuration}) : super(key: key);

  buildHasData(List<SongModel> songs) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return RankingTile.fromSong((index + 1).toString(), songs[index]);
      },
    );
  }

  buildError(Object error) {
    return Center(
      child: Result.error('Something wrong!', subtitle: error.toString()),
    );
  }

  buildDefault() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SongModel>>(
      future: WebService().load(SongModel.topRated(rankDuration)),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return buildHasData(snapshot.data);
        else if (snapshot.hasError) {
          return buildError(snapshot.error);
        }
        return buildDefault();
      },
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
