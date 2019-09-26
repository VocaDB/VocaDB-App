import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/global_variables.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/song_rest_service.dart';
import 'package:vocadb/widgets/action_bar.dart';
import 'package:vocadb/widgets/album_card.dart';
import 'package:vocadb/widgets/artist_tile.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/section.dart';
import 'package:vocadb/widgets/share_action_button.dart';
import 'package:vocadb/widgets/song_tile.dart';
import 'package:vocadb/widgets/source_action_button.dart';
import 'package:vocadb/widgets/space_divider.dart';
import 'package:vocadb/widgets/tags.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SongDetailBloc {

  final int id;
  final SongRestService songService = SongRestService(GlobalVariables.restService);

  BehaviorSubject<SongModel> _song = BehaviorSubject();
  BehaviorSubject<SongModel> _originalVersion = BehaviorSubject();

  Observable get songStream => _song.stream;
  Observable get originalSongStream => _originalVersion.stream;

  SongDetailBloc(this.id) {
    _song.listen(fetched);
    fetch();
  }

  void fetched(SongModel song) {
    if(song.originalVersionId == null) {
      return;
    }

    songService.byId(song.originalVersionId).then(_originalVersion.add);
  }

  void fetch() {
    songService.byId(id).then(_song.add);
  }

  void dispose() {
    _originalVersion?.close();
    _song?.close();
  }
}

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

  SongDetailBloc bloc;
  YoutubePlayerController _controller;

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

  Future dispose() async {
    _controller?.dispose();
    bloc?.dispose();
    super.dispose();
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
            onPlayerInitialized: (controller) {
              _controller = controller;
            },
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

  Widget buildImageWidget(String imageUrl) {
    return imageUrl == null
        ? Placeholder()
        : CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrl,
            placeholder: (context, url) => Container(color: Colors.grey),
            errorWidget: (context, url, error) => new Icon(Icons.error),
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
              opacity: 0.7,
              child: (widget.tag == null || song.thumbUrl == null)
                  ? buildImageWidget(song.thumbUrl)
                  : Hero(
                      tag: widget.tag,
                      child: buildImageWidget(song.thumbUrl),
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
      ActionBar(
        actions: [
          ShareActionButton(
            onTap: () {},
          ),
          SourceActionButton(
            onTap: () {
              String url = '$HOST/S/${song.id}';
              launch(url);
            },
          )
        ],
      ),
      Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Text(song.name, style: Theme.of(this.context).textTheme.title)),
      Tags(song.tags),
      SpaceDivider(),
      Section(
        title: 'Producers',
        children: song.producers
            .map((a) => ArtistTile.artistSong(a,
                tag: 'song_detail_producer_${song.id}_${a.artistId}'))
            .toList(),
      ),
      SpaceDivider(),
      Section(
        title: 'Vocalists',
        children: song.vocalists
            .map((a) => ArtistTile.artistSong(a,
                tag: 'song_detail_vocalist_${song.id}_${a.artistId}'))
            .toList(),
      ),
      SpaceDivider(),
      Section(
        title: 'Other',
        children: song.otherArtists
            .map((a) => ArtistTile.artistSong(a,
                showRole: true,
                tag: 'song_detail_other_${song.id}_${a.artistId}'))
            .toList(),
      ),
      SpaceDivider(),
      Section(
        title: 'Albums',
        horizontal: true,
        children: song.albums
            .map((a) =>
                AlbumCard.album(a, tag: 'song_detail_album_${song.id}_${a.id}'))
            .toList(),
      ),

      StreamBuilder(
        stream: bloc.originalSongStream,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return SongTile.fromEntry(snapshot.data, tag: 'original_${song.id}_${song.originalVersionId}');
          }
          return Container();
        },
      ),
    ];
  }

  Widget buildError(Object error) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: (widget.thumbUrl == null || widget.tag == null)
                ? buildImageWidget(widget.thumbUrl)
                : Hero(
                    tag: widget.tag,
                    child: buildImageWidget(widget.thumbUrl),
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
    Widget defaultWidget = (widget.thumbUrl == null || widget.tag == null)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                child: Hero(
                  tag: widget.tag,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: widget.thumbUrl,
                    placeholder: (context, url) =>
                        Container(color: Colors.grey),
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
          );

    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: defaultWidget,
    );
  }  

  @override
  Widget build(BuildContext context) {

    bloc = SongDetailBloc(widget.id);
 
    return StreamBuilder(
      stream: bloc.songStream,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return buildHasData(snapshot.data);
        } else if(snapshot.hasError) {
          return buildError(snapshot.error);
        }
        
        return buildDefault();
      },
    );
  }


}
