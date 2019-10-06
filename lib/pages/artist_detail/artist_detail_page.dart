import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb/blocs/artist_detail_bloc.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/widgets/action_bar.dart';
import 'package:vocadb/widgets/album_list_section.dart';
import 'package:vocadb/widgets/artist_section.dart';
import 'package:vocadb/widgets/artist_tile.dart';
import 'package:vocadb/widgets/center_content.dart';
import 'package:vocadb/widgets/expandable_content.dart';
import 'package:vocadb/widgets/share_action_button.dart';
import 'package:vocadb/widgets/song_list_section.dart';
import 'package:vocadb/widgets/source_action_button.dart';
import 'package:vocadb/widgets/space_divider.dart';
import 'package:vocadb/widgets/tags.dart';
import 'package:vocadb/widgets/text_info_section.dart';
import 'package:vocadb/widgets/web_link_section.dart';

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
          StreamBuilder(
            stream: Provider.of<ArtistDetailBloc>(context).artist$,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ArtistDetailContent(artist: snapshot.data);
              } else if (snapshot.hasError) {
                return SliverFillRemaining(
                  child: CenterResult.error(
                    message: snapshot.error.toString(),
                  ),
                );
              }

              return SliverFillRemaining(child: CenterLoading());
            },
          ),
        ],
      ),
    );
  }
}

class ArtistInfo extends StatelessWidget {
  final ArtistModel artist;

  const ArtistInfo({Key key, this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                artist.name,
                style: Theme.of(context).textTheme.title,
              ),
              (artist.additionalNames != null)
                  ? Text(artist.additionalNames)
                  : Container(),
              Text(
                artist.artistType,
              ),
            ],
          ),
        ),
        SpaceDivider(),
        Tags(
          artist.tags,
          padding: 0,
        ),
        SpaceDivider(),
        (!artist.isContainsDetail)
            ? null
            : ExpandableContent(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextInfoSection(
                            title: 'Release date',
                            text: artist.releaseDateFormatted,
                          ),
                          TextInfoSection(
                            title: 'Description',
                            text: artist.description,
                          ),
                        ],
                      ),
                    ),
                    (artist.baseVoicebank == null)
                        ? Container()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('Base voicebank',
                                    style: Theme.of(context).textTheme.subhead),
                              ),
                              SpaceDivider(),
                              ArtistTile.fromEntry(
                                artist.baseVoicebank,
                                tag:
                                    'base_voice_bank_${artist.id}_${artist.baseVoicebank.id}',
                              ),
                              SpaceDivider(),
                            ],
                          ),
                    ArtistSection(
                      title: 'Illustrated by',
                      prefixTag: 'illustrated_${artist.id}',
                      artists: artist.illustrators,
                    ),
                    ArtistSection(
                      title: 'Voice provider',
                      prefixTag: 'voice_provider_${artist.id}',
                      artists: artist.voiceProviders,
                    ),
                    ArtistSection(
                      title: 'Groups and labels',
                      prefixTag: 'labels_${artist.id}',
                      artists: artist.groups,
                    ),
                    ArtistSection(
                      title: 'Illustrator of',
                      prefixTag: 'illustrator_of_${artist.id}',
                      artists: artist.illustratedList,
                    ),
                    ArtistSection(
                      title: 'Voice provider of',
                      prefixTag: 'voice_provider_of_${artist.id}',
                      artists: artist.voiceProvidedList,
                    ),
                    ArtistSection(
                      title: 'Members',
                      prefixTag: 'members_${artist.id}',
                      artists: artist.members,
                    ),
                  ],
                ),
              ),
        Divider(),
      ],
    );
  }
}

class ArtistDetailContent extends StatelessWidget {
  final ArtistModel artist;

  const ArtistDetailContent({Key key, this.artist}) : super(key: key);

  Widget buildInfo() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
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
        //
        ArtistInfo(
          artist: artist,
        ),
        SongListSection(
          title: 'Recent Songs/PVs',
          songs: artist.relations.latestSongs,
          horizontal: true,
          prefixTag: 'artist_latest_song_${artist.id}}',
        ),
        SongListSection(
          title: 'Popular songs',
          songs: artist.relations.popularSongs,
          horizontal: true,
          prefixTag: 'artist_popular_song_${artist.id}}',
        ),
        AlbumListSection(
          title: 'Recent or upcoming albums',
          albums: artist.relations.latestAlbums,
          horizontal: true,
          prefixTag: 'artist_latest_album_${artist.id}}',
        ),
        AlbumListSection(
          title: 'Popular albums',
          albums: artist.relations.popularAlbums,
          horizontal: true,
          prefixTag: 'artist_latest_album_${artist.id}}',
        ),
        WebLinkSection(
          webLinks: artist.webLinks,
        ),
      ]),
    );
  }
}
