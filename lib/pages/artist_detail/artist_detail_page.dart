import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb/blocs/artist_detail_bloc.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/favorite_artist_bloc.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/pages/search/more_album_page.dart';
import 'package:vocadb/pages/search/more_song_page.dart';
import 'package:vocadb/pages/search/search_page.dart';
import 'package:vocadb/widgets/album_list_section.dart';
import 'package:vocadb/widgets/artist_section.dart';
import 'package:vocadb/widgets/artist_tile.dart';
import 'package:vocadb/widgets/center_content.dart';
import 'package:vocadb/widgets/expandable_content.dart';
import 'package:vocadb/widgets/like_button.dart';
import 'package:vocadb/widgets/song_list_section.dart';
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
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  SearchScreen.navigate(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.popUntil(context, (r) => r.settings.name == '/');
                },
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(this.name),
              background: SafeArea(
                child: Opacity(
                  opacity: 0.7,
                  child: Hero(
                      tag: this.tag,
                      child: (this.imageUrl == null)
                          ? Icon(Icons.person)
                          : CachedNetworkImage(
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
              Text(FlutterI18n.translate(
                  context, 'artistType.${artist.artistType}')),
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
            ? Container()
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
                            title: FlutterI18n.translate(
                                context, 'label.releasedDate'),
                            text: artist.releaseDateFormatted,
                          ),
                          TextInfoSection(
                            title: FlutterI18n.translate(
                                context, 'label.description'),
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
                                child: Text(
                                    FlutterI18n.translate(
                                        context, 'label.baseVoicebank'),
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
                      title: FlutterI18n.translate(
                          context, 'artistRoleType.illustratedBy'),
                      prefixTag: 'illustrated_${artist.id}',
                      artists: artist.illustrators,
                    ),
                    ArtistSection(
                      title: FlutterI18n.translate(
                          context, 'artistRoleType.voiceProvider'),
                      prefixTag: 'voice_provider_${artist.id}',
                      artists: artist.voiceProviders,
                    ),
                    ArtistSection(
                      title: FlutterI18n.translate(
                          context, 'artistRoleType.groupAndLabels'),
                      prefixTag: 'labels_${artist.id}',
                      artists: artist.groups,
                    ),
                    ArtistSection(
                      title: FlutterI18n.translate(
                          context, 'artistRoleType.illustratorOf'),
                      prefixTag: 'illustrator_of_${artist.id}',
                      artists: artist.illustratedList,
                    ),
                    ArtistSection(
                      title: FlutterI18n.translate(
                          context, 'artistRoleType.voiceProviderOf'),
                      prefixTag: 'voice_provider_of_${artist.id}',
                      artists: artist.voiceProvidedList,
                    ),
                    ArtistSection(
                      title: FlutterI18n.translate(
                          context, 'artistRoleType.members'),
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: StreamBuilder(
                  stream: Provider.of<FavoriteArtistBloc>(context).artists$,
                  builder: (context, snapshot) {
                    Map<int, ArtistModel> artistMap = snapshot.data;

                    if ((artistMap != null &&
                        artistMap.containsKey(artist.id))) {
                      return LikeButton(
                        onPressed: () =>
                            Provider.of<FavoriteArtistBloc>(context)
                                .remove(artist.id),
                        isLiked: true,
                      );
                    }

                    return LikeButton(
                      onPressed: () =>
                          Provider.of<FavoriteArtistBloc>(context).add(artist),
                    );
                  },
                ),
              ),
              Expanded(
                child: FlatButton(
                    onPressed: () => Share.share('$HOST/Ar/${artist.id}'),
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
                      String url = '$HOST/Ar/${artist.id}';
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
        //
        ArtistInfo(
          artist: artist,
        ),
        SongListSection(
          title: FlutterI18n.translate(context, 'label.recentSongsPVs'),
          songs: artist.relations.latestSongs,
          horizontal: true,
          prefixTag: 'artist_latest_song_${artist.id}}',
          extraMenus: PopupMenuButton<String>(
            onSelected: (String selectedValue) {
              MoreSongScreen.showLatestByArtist(
                  context, 'More songs from ${artist.name}', artist.id);
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'more',
                child: Text(FlutterI18n.translate(context, 'label.showMore')),
              ),
            ],
          ),
        ),
        SongListSection(
          title: FlutterI18n.translate(context, 'label.popularSongs'),
          songs: artist.relations.popularSongs,
          horizontal: true,
          prefixTag: 'artist_popular_song_${artist.id}}',
          extraMenus: PopupMenuButton<String>(
            onSelected: (String selectedValue) {
              MoreSongScreen.showTopByArtist(
                  context, 'Top songs from ${artist.name}', artist.id);
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'more',
                child: Text(FlutterI18n.translate(context, 'label.showMore')),
              ),
            ],
          ),
        ),
        AlbumListSection(
          title: FlutterI18n.translate(context, 'label.recentAlbums'),
          albums: artist.relations.latestAlbums,
          horizontal: true,
          prefixTag: 'artist_latest_album_${artist.id}}',
          extraMenus: PopupMenuButton<String>(
            onSelected: (String selectedValue) {
              MoreAlbumScreen.showLatestByArtist(
                  context, 'Latest albums from ${artist.name}', artist.id);
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'more',
                child: Text(FlutterI18n.translate(context, 'label.showMore')),
              ),
            ],
          ),
        ),
        AlbumListSection(
          title: FlutterI18n.translate(context, 'label.popularAlbums'),
          albums: artist.relations.popularAlbums,
          horizontal: true,
          prefixTag: 'artist_latest_album_${artist.id}}',
          extraMenus: PopupMenuButton<String>(
            onSelected: (String selectedValue) {
              MoreAlbumScreen.showTopByArtist(
                  context, 'Top albums from ${artist.name}', artist.id);
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'more',
                child: Text(FlutterI18n.translate(context, 'label.showMore')),
              ),
            ],
          ),
        ),
        WebLinkSection(
          webLinks: artist.webLinks,
        ),
      ]),
    );
  }
}
