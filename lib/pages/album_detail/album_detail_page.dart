import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb/blocs/album_detail_bloc.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/track_model.dart';
import 'package:vocadb/widgets/action_bar.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/share_action_button.dart';
import 'package:vocadb/widgets/source_action_button.dart';
import 'package:vocadb/widgets/space_divider.dart';
import 'package:vocadb/widgets/tags.dart';
import "package:collection/collection.dart";
import 'package:vocadb/widgets/album_track.dart';

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
      child: AlbumDetailPage(
          id: args.id, name: args.name, thumbUrl: args.thumbUrl, tag: args.tag),
    );
  }
}

class AlbumDetailPage extends StatelessWidget {
  final int id;
  final String name;
  final String thumbUrl;
  final String tag;

  const AlbumDetailPage({Key key, this.id, this.name, this.thumbUrl, this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            title: Text(this.name),
          ),
          HeroContent(this.name, this.thumbUrl, this.tag),
          AlbumDetailContent(this.id)
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
      ActionBar(
        actions: [
          ShareActionButton(
            onTap: () {
              Share.share('$HOST/Al/${album.id}');
            },
          ),
          SourceActionButton(
            onTap: () {
              String url = '$HOST/Al/${album.id}';
              launch(url);
            },
          )
        ],
      ),
      SpaceDivider(),
      Tags(album.tags),
      SpaceDivider(),
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

  buildHasData(List<TrackModel> tracks) {
    List<Widget> widgets = List();

    var groupTracks = groupBy(tracks, (t) => t.discNumber);

    if (groupTracks.length < 2) {
      var discTracks = tracks.map((t) => AlbumTrack(t)).toList();

      widgets.addAll(discTracks);
      widgets.add(SpaceDivider());
    } else {
      groupTracks.forEach((disc, List<TrackModel> t) {
        widgets.add(Text("Disc $disc"));

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
    return (this.tracks != null) ? buildHasData(tracks) : buildDefault();
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
            SpaceDivider(),
            Text(this.name,
                style: Theme.of(context).textTheme.title,
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
