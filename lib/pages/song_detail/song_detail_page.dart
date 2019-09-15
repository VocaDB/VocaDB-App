import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/web_service.dart';
import 'package:vocadb/widgets/action_bar.dart';
import 'package:vocadb/widgets/action_button.dart';
import 'package:vocadb/widgets/like_action_button.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/share_action_button.dart';
import 'package:vocadb/widgets/source_action_button.dart';
import 'package:vocadb/widgets/space_divider.dart';
import 'package:vocadb/widgets/tags.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SongDetailPage extends StatefulWidget {
  final int id;
  final String name;
  final String thumbUrl;
  final String tag;

  const SongDetailPage(this.id, this.name, this.thumbUrl, {this.tag});

  @override
  _SongDetailPageState createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {
  Widget buildPlayerWithContent(String url) {
    return YoutubePlayer(
      context: context,
      videoId: YoutubePlayer.convertUrlToId(url),
      flags: YoutubePlayerFlags(
        autoPlay: false,
        showVideoProgressIndicator: true,
      ),
    );
  }

  Widget buildHasData(SongModel song) {
    return (song.youtubePV == null)
        ? buildWithoutPlayer(song)
        : buildWithPlayer(song);
  }

  Widget buildWithPlayer(SongModel song) {
    return Scaffold(
      appBar: AppBar(title: Text(song.name)),
      body: Column(
        children: <Widget>[
          YoutubePlayer(
            context: context,
            videoId: YoutubePlayer.convertUrlToId(song.youtubePV.url),
            flags: YoutubePlayerFlags(
              autoPlay: false,
              showVideoProgressIndicator: true,
            ),
          ),
          Expanded(
            child: ListView(
              children: buildDetailContent(song),
            ),
          )
        ],
      ),
    );
  }

  Widget buildWithoutPlayer(SongModel song) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200,
          title: Text(widget.name),
          flexibleSpace: FlexibleSpaceBar(
            background: Opacity(
              opacity: 0.5,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.thumbUrl,
                placeholder: (context, url) => Container(color: Colors.grey),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed(buildDetailContent(song)),
        )
      ],
    ));
  }

  List<Widget> buildDetailContent(SongModel song) {
    return [
      ActionBar(actions: <ActionButton>[
        LikeActionButton(),
        ShareActionButton(),
        SourceActionButton(),
      ]),
      SpaceDivider(),
      Padding(
          padding: EdgeInsets.all(16.0),
          child:
              Text(song.name, style: Theme.of(this.context).textTheme.title)),
      Tags(song.tags),
    ];
  }

  Widget buildError(Object error) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: Hero(
              tag: widget.tag,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.thumbUrl,
                placeholder: (context, url) => Container(color: Colors.grey),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child:
                  Result.error('Something wrong!', subtitle: error.toString()),
            ),
          )
        ],
      ),
    );
  }

  Widget buildDefault() {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            child: Hero(
              tag: widget.tag,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.thumbUrl,
                placeholder: (context, url) => Container(color: Colors.grey),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SongModel>(
      future: WebService().load(SongModel.byId(widget.id)),
      builder: (context, snapshot) {
//        if (snapshot.hasData)
//          return buildHasData(snapshot.data);
//        else if (snapshot.hasError) {
//          return buildError(snapshot.error);
//        }

        return buildDefault();
      },
    );
  }
}
