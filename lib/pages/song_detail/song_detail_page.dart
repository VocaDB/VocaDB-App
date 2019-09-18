import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/web_service.dart';
import 'package:vocadb/widgets/album_card.dart';
import 'package:vocadb/widgets/artist_tile.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/section.dart';
import 'package:vocadb/widgets/section_divider.dart';
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
              autoPlay: true,
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
      Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Text(song.name, style: Theme.of(this.context).textTheme.title)),
      Tags(song.tags),
      SectionDivider(),
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
      SectionDivider(),
      Section(
        title: 'Albums',
        horizontal: true,
        children: song.albums
            .map((a) =>
                AlbumCard.album(a, tag: 'song_detail_album_${song.id}_${a.id}'))
            .toList(),
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
    return FutureBuilder<SongModel>(
      future: WebService().load(SongModel.byId(widget.id)),
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
