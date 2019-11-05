import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/tag_detail_bloc.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/pages/search/search_page.dart';
import 'package:vocadb/widgets/album_list_section.dart';
import 'package:vocadb/widgets/artist_section.dart';
import 'package:vocadb/widgets/expandable_content.dart';
import 'package:vocadb/widgets/info_section.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/song_list_section.dart';
import 'package:vocadb/widgets/tags.dart';
import 'package:vocadb/widgets/text_info_section.dart';
import 'package:vocadb/widgets/web_link_section.dart';

class TagDetailScreenArguments {
  final int id;
  final String name;

  TagDetailScreenArguments(this.id, this.name);
}

class TagDetailScreen extends StatelessWidget {
  static const String routeName = '/tagDetail';

  static void navigate(BuildContext context, int id, String name) {
    Navigator.pushNamed(context, TagDetailScreen.routeName,
        arguments: TagDetailScreenArguments(id, name));
  }

  @override
  Widget build(BuildContext context) {
    final TagDetailScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final configBloc = Provider.of<ConfigBloc>(context);

    return Provider<TagDetailBloc>(
      builder: (context) => TagDetailBloc(args.id, configBloc: configBloc),
      dispose: (context, bloc) => bloc.dispose(),
      child: TagDetailPage(args.id, args.name),
    );
  }
}

class TagDetailPage extends StatelessWidget {
  final int id;
  final String name;

  const TagDetailPage(this.id, this.name);

  toTagDetailPage(BuildContext context, TagModel tagModel) {
    Navigator.pushNamed(context, TagDetailScreen.routeName,
        arguments: TagDetailScreenArguments(tagModel.id, tagModel.name));
  }

  buildData(BuildContext context, TagModel tag) {
    final bloc = Provider.of<TagDetailBloc>(context);

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
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
            title: Text("#" + this.name),
            background: (tag.imageUrl == null)
                ? Container()
                : CachedNetworkImage(
                    imageUrl: tag.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(color: Colors.grey),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                        onPressed: () => Share.share('$HOST/T/${tag.id}'),
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
                          String url = '$HOST/T/${tag.id}';
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextInfoSection(
                    title: FlutterI18n.translate(context, 'label.name'),
                    text: tag.additionalNames,
                  ),
                  TextInfoSection(
                    title: FlutterI18n.translate(context, 'label.category'),
                    text: tag.categoryName,
                  ),
                  InfoSection(
                    title: FlutterI18n.translate(context, 'label.parentTag'),
                    visible: tag.parent != null,
                    child: Tag(
                        tag.parent, () => toTagDetailPage(context, tag.parent)),
                  ),
                ],
              ),
            ),
            (tag.description.isEmpty)
                ? Container()
                : ExpandableContent(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextInfoSection(
                            title: FlutterI18n.translate(
                                context, 'label.description'),
                            text: tag.description,
                          )
                        ],
                      ),
                    ),
                  ),
            StreamBuilder(
              stream: bloc.latestSongs$,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();

                return SongListSection(
                  title: FlutterI18n.translate(context, 'label.recentSongsPVs'),
                  songs: snapshot.data,
                  horizontal: true,
                  prefixTag: 'tag_latest_song_${tag.id}',
                );
              },
            ),
            StreamBuilder(
              stream: bloc.topSongs$,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();

                return SongListSection(
                  title: FlutterI18n.translate(context, 'label.topSongs'),
                  songs: snapshot.data,
                  horizontal: true,
                  prefixTag: 'tag_top_song_${tag.id}',
                );
              },
            ),
            StreamBuilder(
              stream: bloc.topAlbums$,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();

                return AlbumListSection(
                  title: FlutterI18n.translate(context, 'label.topAlbums'),
                  albums: snapshot.data,
                  horizontal: true,
                  prefixTag: 'tag_top_album_${tag.id}',
                );
              },
            ),
            StreamBuilder(
              stream: bloc.topArtists$,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();

                return ArtistSection(
                  title: FlutterI18n.translate(context, 'label.topArtists'),
                  artists: snapshot.data,
                  prefixTag: 'tag_top_artist_${tag.id}',
                );
              },
            ),
            WebLinkSection(
                webLinks: tag.webLinks,
                title: FlutterI18n.translate(context, 'label.references'))
          ]),
        )
      ],
    );
  }

  buildError(BuildContext context, Object error) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
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
        ),
        SliverFillRemaining(
          child: Center(
            child: Result.error("Error", subtitle: error.toString()),
          ),
        )
      ],
    );
  }

  buildLoading(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
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
        ),
        SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Provider.of<TagDetailBloc>(context).tag$,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildData(context, snapshot.data);
          } else if (snapshot.hasError) {
            return buildError(context, snapshot.error.toString());
          }

          return buildLoading(context);
        },
      ),
    );
  }
}
