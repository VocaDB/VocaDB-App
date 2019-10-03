import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb/blocs/artist_detail_bloc.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/services/web_service.dart';
import 'package:vocadb/widgets/action_bar.dart';
import 'package:vocadb/widgets/album_card.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/share_action_button.dart';
import 'package:vocadb/widgets/song_card.dart';
import 'package:vocadb/widgets/section.dart';
import 'package:vocadb/widgets/section_divider.dart';
import 'package:vocadb/widgets/source_action_button.dart';
import 'package:vocadb/widgets/tags.dart';

class ArtistDetailScreenArguments {
  final int id;
  final String name;
  final String thumbUrl;
  final String tag;

  ArtistDetailScreenArguments(this.id, this.name, {this.thumbUrl, this.tag});
}

class ArtistDetailScreen extends StatelessWidget {
  static const String routeName = '/artistDetail';

  @override
  Widget build(BuildContext context) {
    final ArtistDetailScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final configBloc = Provider.of<ConfigBloc>(context);

    return Provider<ArtistDetailBloc>(
      builder: (context) => ArtistDetailBloc(args.id, configBloc: configBloc),
      dispose: (context, bloc) => bloc.dispose(),
      child: ArtistDetailPage(args.id, args.name, args.thumbUrl, args.tag),
    );
  }
}

class ArtistDetailPage extends StatelessWidget {
  final int id;
  final String name;
  final String imageUrl;
  final String tag;

  const ArtistDetailPage(this.id, this.name, this.imageUrl, this.tag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(this.name),
              background: SafeArea(
                child: Opacity(
                  opacity: 0.7,
                  child: Hero(
                      tag: this.tag,
                      child: CachedNetworkImage(
                        imageUrl: this.imageUrl,
                        placeholder: (context, url) =>
                            Container(color: Colors.grey),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      )),
                ),
              ),
            ),
          ),
          ArtistDetailContent(this.id),
        ],
      ),
    );
  }
}

class ArtistDetailContent extends StatefulWidget {
  final int id;

  const ArtistDetailContent(this.id);

  @override
  _ArtistDetailContentState createState() => _ArtistDetailContentState();
}

class _ArtistDetailContentState extends State<ArtistDetailContent> {
  @override
  void initState() {
    super.initState();
  }

  buildHasData(ArtistModel artist) {
    return SliverList(delegate: SliverChildListDelegate(detailWidgets(artist)));
  }

  buildError(Object error) {
    return SliverFillRemaining(
      child: Result.error('Something wrong!', subtitle: error.toString()),
    );
  }

  buildDefault() {
    return SliverFillRemaining(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  List<Widget> detailWidgets(ArtistModel artist) {
    List<Widget> widgets = [
      ActionBar(
        actions: [
          ShareActionButton(
            onTap: () {
              Share.share('$HOST/Ar/${artist.id}');
            },
          ),
          SourceActionButton(
            onTap: () {
              String url = '$HOST/Ar/${artist.id}';
              launch(url);
            },
          )
        ],
      ),
      Tags(artist.tags),
      SectionDivider(),
      Section(
          title: 'Recent Songs/PVs',
          horizontal: true,
          children: artist.relations.latestSongs
              .map((s) => SongCard.song(s,
                  tag: 'artist_detail_latest_song_${artist.id}_${s.id}'))
              .toList()),
      SectionDivider(),
      Section(
          title: 'Popular songs',
          horizontal: true,
          children: artist.relations.popularSongs
              .map((s) => SongCard.song(s,
                  tag: 'artist_detail_popular_song_${artist.id}_${s.id}'))
              .toList()),
      SectionDivider(),
      Section(
          title: 'Recent or upcoming albums',
          horizontal: true,
          children: artist.relations.latestAlbums
              .map((s) => AlbumCard.album(s,
                  tag: 'artist_detail_latest_album_${artist.id}_${s.id}'))
              .toList()),
      SectionDivider(),
      Section(
          title: 'Popular albums',
          horizontal: true,
          children: artist.relations.popularAlbums
              .map((s) => AlbumCard.album(s,
                  tag: 'artist_detail_popular_album_${artist.id}_${s.id}'))
              .toList()),
    ];
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<ArtistDetailBloc>(context).artist$,
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
