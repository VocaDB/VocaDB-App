import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb/blocs/album_detail_bloc.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/favorite_album_bloc.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/track_model.dart';
import 'package:vocadb/widgets/artist_section.dart';
import 'package:vocadb/widgets/expandable_content.dart';
import 'package:vocadb/widgets/like_button.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/space_divider.dart';
import 'package:vocadb/widgets/tags.dart';
import "package:collection/collection.dart";
import 'package:vocadb/widgets/album_track.dart';
import 'package:vocadb/widgets/text_info_section.dart';

class AlbumDetailScreenArguments {
  final int id;
  final String name;
  final String thumbUrl;
  final String tag;

  AlbumDetailScreenArguments(this.id, this.name, {this.thumbUrl, this.tag});
}

class AlbumDetailScreen extends StatelessWidget {
  static const String routeName = '/albumDetail';

  @override
  Widget build(BuildContext context) {
    final AlbumDetailScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final configBloc = Provider.of<ConfigBloc>(context);

    return Provider<AlbumDetailBloc>(
      builder: (context) => AlbumDetailBloc(args.id, configBloc: configBloc),
      dispose: (context, bloc) => bloc.dispose(),
      child: AlbumDetailPage(),
    );
  }
}

class AlbumDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AlbumDetailScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            title: Text(args.name),
          ),
          HeroContent(args.name, args.thumbUrl, args.tag),
          AlbumDetailContent(args.id)
        ],
      ),
    );
  }
}

class AlbumDetailContent extends StatefulWidget {
  final int id;

  const AlbumDetailContent(this.id);

  @override
  _AlbumDetailContentState createState() => _AlbumDetailContentState();
}

class _AlbumDetailContentState extends State<AlbumDetailContent> {
  @override
  void initState() {
    super.initState();
  }

  buildHasData(AlbumModel album) {
    return SliverList(delegate: SliverChildListDelegate(detailWidgets(album)));
  }

  buildError(String error) {
    return SliverFillRemaining(
      child: Result.error('Something wrong!', subtitle: error),
    );
  }

  buildDefault() {
    return SliverFillRemaining(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  List<Widget> detailWidgets(AlbumModel album) {
    List<Widget> widgets = [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              album.name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              album.artistString,
            ),
          ],
        ),
      ),
      Container(
        height: 64,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            (album.ratingAverage == 0)
                ? Text(FlutterI18n.translate(context, 'label.noRating'),
                    style: Theme.of(context).textTheme.caption)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('${album.ratingAverage} ★',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                          FlutterI18n.translate(context, 'label.ratingCount',
                              {'rating': '${album.ratingCount}'}),
                          style: Theme.of(context).textTheme.caption)
                    ],
                  ),
            Text(album.discType),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(album.releaseDateFormatted),
                SizedBox(
                  height: 4,
                ),
                Text(FlutterI18n.translate(context, 'label.releasedDate'),
                    style: Theme.of(context).textTheme.caption)
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                stream: Provider.of<FavoriteAlbumBloc>(context).albums$,
                builder: (context, snapshot) {
                  Map<int, AlbumModel> songMap = snapshot.data;

                  if ((songMap != null && songMap.containsKey(album.id))) {
                    return LikeButton(
                      onPressed: () => Provider.of<FavoriteAlbumBloc>(context)
                          .remove(album.id),
                      isLiked: true,
                    );
                  }

                  return LikeButton(
                    onPressed: () =>
                        Provider.of<FavoriteAlbumBloc>(context).add(album),
                  );
                },
              ),
            ),
            Expanded(
              child: FlatButton(
                  onPressed: () => Share.share('$HOST/Al/${album.id}'),
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
                    String url = '$HOST/Al/${album.id}';
                    launch(url);
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
      SpaceDivider(),
      Tags(album.tags),
      ExpandableContent(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SpaceDivider(),
            TextInfoSection(
              title: FlutterI18n.translate(context, 'label.name'),
              text: album.name,
            ),
            (album.additionalNames == null)
                ? Container()
                : Text(album.additionalNames),
            TextInfoSection(
              title: FlutterI18n.translate(context, 'label.description'),
              text: album.description,
            ),
            Divider(),
            ArtistForAlbumSection(
              title: FlutterI18n.translate(context, 'label.producers'),
              prefixTag: 'producer_${album.id}',
              artists: album.producers,
            ),
            ArtistForAlbumSection(
              title: FlutterI18n.translate(context, 'label.vocalists'),
              prefixTag: 'vocalist_${album.id}',
              artists: album.vocalists,
            ),
            ArtistForAlbumSection(
              title: FlutterI18n.translate(context, 'label.labels'),
              prefixTag: 'labels_${album.id}',
              artists: album.labels,
            ),
            ArtistForAlbumSection(
              title: FlutterI18n.translate(context, 'label.other'),
              prefixTag: 'other_${album.id}',
              artists: album.otherArtists,
            ),
          ],
        ),
      )),
      TrackList(album.tracks),
    ];
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<AlbumDetailBloc>(context).album$,
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

class TrackList extends StatelessWidget {
  final List<TrackModel> tracks;

  const TrackList(this.tracks);

  buildHasData(BuildContext context, List<TrackModel> tracks) {
    List<Widget> widgets = List();

    var groupTracks = groupBy(tracks, (t) => t.discNumber);

    if (groupTracks.length < 2) {
      var discTracks = tracks.map((t) => AlbumTrack(t)).toList();

      widgets.addAll(discTracks);
      widgets.add(SpaceDivider());
    } else {
      groupTracks.forEach((disc, List<TrackModel> t) {
        widgets.add(Text(
            FlutterI18n.translate(context, 'label.discNo', {'disc': disc})));

        var discTracks = tracks.map((t) => AlbumTrack(t)).toList();

        widgets.addAll(discTracks);
        widgets.add(SpaceDivider());
      });
    }

    return Container(
      child: Column(
        children: widgets,
      ),
    );
  }

  buildError() {
    return Container(
      child: Text('Error loading tracks'),
    );
  }

  buildDefault() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return (this.tracks != null)
        ? buildHasData(context, tracks)
        : buildDefault();
  }
}

class HeroContent extends StatelessWidget {
  final String name;
  final String thumbUrl;
  final String tag;

  HeroContent(this.name, this.thumbUrl, this.tag);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(16.0),
      sliver: SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 160,
                height: 160,
                child: Hero(
                    tag: this.tag,
                    child: CachedNetworkImage(
                      imageUrl: this.thumbUrl,
                      placeholder: (context, url) =>
                          Container(color: Colors.grey),
                      errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
                    ))),
          ],
        ),
      ),
    );
  }
}
