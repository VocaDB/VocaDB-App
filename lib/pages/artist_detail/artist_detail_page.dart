import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/services/web_service.dart';
import 'package:vocadb/widgets/album_card.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/song_card.dart';
import 'package:vocadb/widgets/section.dart';
import 'package:vocadb/widgets/section_divider.dart';
import 'package:vocadb/widgets/tags.dart';

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
      Tags(artist.tags),
      SectionDivider(),
      Section(
          title: 'Recent Songs/PVs',
          horizontal: true,
          children: artist.relations.latestSongs
              .map((s) => SongCard.song(s))
              .toList()),
      SectionDivider(),
      Section(
          title: 'Popular songs',
          horizontal: true,
          children: artist.relations.popularSongs
              .map((s) => SongCard.song(s))
              .toList()),
      SectionDivider(),
      Section(
          title: 'Recent or upcoming albums',
          horizontal: true,
          children: artist.relations.latestAlbums
              .map((s) => AlbumCard.album(s))
              .toList()),
      SectionDivider(),
      Section(
          title: 'Popular albums',
          horizontal: true,
          children: artist.relations.popularAlbums
              .map((s) => AlbumCard.album(s))
              .toList()),
    ];
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArtistModel>(
      future: WebService().load(ArtistModel.byId(widget.id)),
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
