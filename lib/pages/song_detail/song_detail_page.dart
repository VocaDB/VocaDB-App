import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/favorite_song_bloc.dart';
import 'package:vocadb/blocs/lyric_content_bloc.dart';
import 'package:vocadb/blocs/song_detail_bloc.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/pv_model.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/pages/song_detail/lyric_content.dart';
import 'package:vocadb/widgets/album_card.dart';
import 'package:vocadb/widgets/artist_tile.dart';
import 'package:vocadb/widgets/like_button.dart';
import 'package:vocadb/widgets/pv_tile.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/section.dart';
import 'package:vocadb/widgets/song_card.dart';
import 'package:vocadb/widgets/song_tile.dart';
import 'package:vocadb/widgets/space_divider.dart';
import 'package:vocadb/widgets/tags.dart';
import 'package:vocadb/widgets/web_link_section.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:share/share.dart';

class SongDetailScreenArguments {
  final int id;
  final String name;
  final String thumbUrl;
  final String tag;

  SongDetailScreenArguments(this.id, this.name, {this.thumbUrl, this.tag});
}

class SongDetailScreen extends StatelessWidget {
  static const String routeName = '/songDetail';

  static void navigateToSongDetail(BuildContext context, SongModel song,
      {String tag}) {
    Navigator.pushNamed(context, SongDetailScreen.routeName,
        arguments: SongDetailScreenArguments(song.id, song.name,
            thumbUrl: song.thumbUrl, tag: tag));
  }

  @override
  Widget build(BuildContext context) {
    final SongDetailScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final configBloc = Provider.of<ConfigBloc>(context);

    return Provider<SongDetailBloc>(
      builder: (context) => SongDetailBloc(args.id, configBloc: configBloc),
      dispose: (context, bloc) => bloc.dispose(),
      child: SongDetailPage(args.id, args.name, args.thumbUrl, tag: args.tag),
    );
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
            child: StreamBuilder(
              stream: Provider.of<SongDetailBloc>(context).showHideLyric$,
              initialData: false,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return ListView(
                    children: buildDetailContent(song),
                  );
                }

                bool showLyric = snapshot.data;

                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: (showLyric)
                      ? Provider<LyricContentBloc>(
                          builder: (context) => LyricContentBloc(song.lyrics),
                          dispose: (context, bloc) => bloc.dispose(),
                          child: LyricContent(
                              lyrics: song.lyrics,
                              onTapClose: Provider.of<SongDetailBloc>(context)
                                  .hideLyric),
                        )
                      : ListView(
                          children: buildDetailContent(song),
                        ),
                );
              },
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
        StreamBuilder(
          stream: Provider.of<SongDetailBloc>(context).showHideLyric$,
          initialData: false,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SliverList(
                delegate:
                    SliverChildListDelegate.fixed(buildDetailContent(song)),
              );
            }

            bool showLyric = snapshot.data;

//            return SliverList(
//              delegate: SliverChildListDelegate.fixed(buildDetailContent(song)),
//            );

            if (showLyric) {
              return SliverFillRemaining(
                child: buildLyricContent(song),
              );
            }

            return SliverList(
              delegate: SliverChildListDelegate.fixed(buildDetailContent(song)),
            );
          },
        ),
      ],
    ));
  }

  Widget buildLyricContent(SongModel song) {
    return Provider<LyricContentBloc>(
      builder: (context) => LyricContentBloc(song.lyrics),
      dispose: (context, bloc) => bloc.dispose(),
      child: LyricContent(
          lyrics: song.lyrics,
          onTapClose: Provider.of<SongDetailBloc>(context).hideLyric),
    );
  }

  List<Widget> buildDetailContent(SongModel song) {
    List<Widget> headerContent = [];
    headerContent
        .add(Text(song.name, style: Theme.of(context).textTheme.title));

    if (song.additionalNames != null && song.additionalNames.isNotEmpty) {
      headerContent.add(Text(song.additionalNames));
    }

    headerContent.add(SpaceDivider());
    headerContent.add(Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(song.songType),
        Text(' • '),
        Text(
            FlutterI18n.translate(context, 'label.publishedOn',
                {'date': song.publishDateFormatted}),
            style: Theme.of(context).textTheme.caption)
      ],
    ));

    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                stream: Provider.of<FavoriteSongBloc>(context).songs$,
                builder: (context, snapshot) {
                  Map<int, SongModel> songMap = snapshot.data;

                  if ((songMap != null && songMap.containsKey(song.id))) {
                    return LikeButton(
                      onPressed: () => Provider.of<FavoriteSongBloc>(context)
                          .remove(song.id),
                      isLiked: true,
                    );
                  }

                  return LikeButton(
                    onPressed: () =>
                        Provider.of<FavoriteSongBloc>(context).add(song),
                  );
                },
              ),
            ),
            (song.lyrics.isEmpty)
                ? Container()
                : Expanded(
                    child: FlatButton(
                        onPressed: () =>
                            Provider.of<SongDetailBloc>(context).showLyric(),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.subtitles,
                            ),
                            Text(FlutterI18n.translate(context, 'label.lyrics'),
                                style: TextStyle(fontSize: 12))
                          ],
                        )),
                  ),
            Expanded(
              child: FlatButton(
                  onPressed: () => Share.share('$HOST/S/${song.id}'),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.share,
                      ),
                      Text(FlutterI18n.translate(context, 'label.share'),
                          style: TextStyle(fontSize: 12))
                    ],
                  )),
            ),
            Expanded(
              child: FlatButton(
                  onPressed: () {
                    launch('$HOST/S/${song.id}');
                  },
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.info,
                      ),
                      Text(FlutterI18n.translate(context, 'label.info'),
                          style: TextStyle(fontSize: 12))
                    ],
                  )),
            ),
          ],
        ),
      ),
      Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: headerContent,
          )),
      Tags(song.tags),
      Divider(),
      Section(
        title: FlutterI18n.translate(context, 'label.producers'),
        children: song.producers
            .map((a) => ArtistTile.artistSong(a,
                tag: 'song_detail_producer_${song.id}_${a.artistId}'))
            .toList(),
      ),
      SpaceDivider(),
      Section(
        title: FlutterI18n.translate(context, 'label.vocalists'),
        children: song.vocalists
            .map((a) => ArtistTile.artistSong(a,
                tag: 'song_detail_vocalist_${song.id}_${a.artistId}'))
            .toList(),
      ),
      SpaceDivider(),
      Section(
        title: FlutterI18n.translate(context, 'label.other'),
        children: song.otherArtists
            .map((a) => ArtistTile.artistSong(a,
                showRole: true,
                tag: 'song_detail_other_${song.id}_${a.artistId}'))
            .toList(),
      ),
      Divider(),
      PVSection(pvs: song.pvs),
      AlbumSection(
          albums: song.albums, tagPrefix: 'song_detail_album_${song.id}'),
      ContentSection(
        title: FlutterI18n.translate(context, 'label.original'),
        hide: !song.hasOriginalVersion,
        child: StreamBuilder(
          stream: Provider.of<SongDetailBloc>(context).originalVersion$,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SongTile.fromSong(snapshot.data,
                  tag: 'original_${song.id}_${song.originalVersionId}');
            }
            return Container();
          },
        ),
      ),
      StreamBuilder(
        stream: Provider.of<SongDetailBloc>(context).altVersions$,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<SongModel> alts = snapshot.data;

            if (alts.isEmpty) return Container();

            return Column(
              children: <Widget>[
                Section(
                  title:
                      FlutterI18n.translate(context, 'label.alternateVersions'),
                  horizontal: true,
                  children: alts
                      .map<Widget>((SongModel alt) => SongCard.song(alt,
                          tag: 'song_alt_${song.id}_${alt.id}'))
                      .toList(),
                ),
                Divider()
              ],
            );
          } else {
            return Container();
          }
        },
      ),
      StreamBuilder(
        stream: Provider.of<SongDetailBloc>(context).relatedSongs$,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<SongModel> relatedSongs = snapshot.data;

            List<Widget> children = relatedSongs
                .map<Widget>((SongModel alt) => SongCard.song(alt,
                    tag: 'song_related_${song.id}_${alt.id}'))
                .toList();
            return Column(
              children: <Widget>[
                Section(
                  title: FlutterI18n.translate(context, 'label.likeMatches'),
                  horizontal: true,
                  children: children,
                ),
                Divider()
              ],
            );
          } else {
            return Container();
          }
        },
      ),
      WebLinkSection(webLinks: song.webLinks)
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
    return StreamBuilder(
      stream: Provider.of<SongDetailBloc>(context).song$,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildHasData(snapshot.data);
        } else if (snapshot.hasError) {
          return buildError(snapshot.error);
        }

        return buildDefault();
      },
    );
  }
}

class AlbumSection extends StatelessWidget {
  final List<AlbumModel> albums;
  final String tagPrefix;

  const AlbumSection({Key key, this.albums, this.tagPrefix}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (albums.length == 0) {
      return Container();
    }

    return Column(
      children: <Widget>[
        Section(
          title: FlutterI18n.translate(context, 'label.albums'),
          horizontal: true,
          children: albums
              .map((a) => AlbumCard.album(a, tag: '${this.tagPrefix}_${a.id}'))
              .toList(),
        ),
        Divider(),
      ],
    );
  }
}

class PVSection extends StatelessWidget {
  final List<PVModel> pvs;

  const PVSection({Key key, this.pvs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if (pvs.length == 0) {
      return Container();
    }

    final pvList = PVList(pvs);

    children.add(Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        FlutterI18n.translate(context, 'label.originalMedia'),
        textDirection: TextDirection.ltr,
        style: Theme.of(context).textTheme.subhead,
      ),
    ));

    List<Widget> originalPVs =
        pvList.originalPVs.map((pv) => PVTile(pv: pv)).toList();

    children.addAll(originalPVs);

    List<Widget> otherPVs =
        pvList.otherPVs.map((pv) => PVTile(pv: pv)).toList();

    if (otherPVs.length > 0) {
      children.add(Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          FlutterI18n.translate(context, 'label.otherMedia'),
          textDirection: TextDirection.ltr,
          style: Theme.of(context).textTheme.subhead,
        ),
      ));

      children.addAll(otherPVs);
    }

    children.add(Divider());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

class ContentSection extends StatelessWidget {
  final String title;
  final Widget child;
  final bool hide;

  const ContentSection({Key key, this.title, this.child, this.hide = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (hide) return Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            FlutterI18n.translate(context, 'label.original'),
            textDirection: TextDirection.ltr,
            style: Theme.of(context).textTheme.subhead,
          ),
        ),
        child
      ],
    );
  }
}
