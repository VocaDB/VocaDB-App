import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/tag_detail_bloc.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/widgets/action_bar.dart';
import 'package:vocadb/widgets/album_list_section.dart';
import 'package:vocadb/widgets/artist_section.dart';
import 'package:vocadb/widgets/expandable_content.dart';
import 'package:vocadb/widgets/info_section.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/share_action_button.dart';
import 'package:vocadb/widgets/song_list_section.dart';
import 'package:vocadb/widgets/source_action_button.dart';
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
            ActionBar(
              actions: [
                ShareActionButton(
                  onTap: () {
                    Share.share('$HOST/T/${tag.id}');
                  },
                ),
                SourceActionButton(
                  onTap: () {
                    String url = '$HOST/T/${tag.id}';
                    launch(url);
                  },
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextInfoSection(
                    title: 'Name',
                    text: tag.additionalNames,
                  ),
                  TextInfoSection(
                    title: 'Category',
                    text: tag.categoryName,
                  ),
                  InfoSection(
                    title: 'Parent',
                    visible: tag.parent != null,
                    child: Tag(
                        tag.parent, () => toTagDetailPage(context, tag.parent)),
                  ),
                ],
              ),
            ),
            ExpandableContent(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextInfoSection(
                      title: 'Description',
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
                  title: 'Latest songs',
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
                  title: 'Top songs',
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
                  title: 'Top albums',
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
                  title: 'Top artists',
                  artists: snapshot.data,
                  prefixTag: 'tag_top_artist_${tag.id}',
                );
              },
            ),
            WebLinkSection(webLinks: tag.webLinks, title: "References")
          ]),
        )
      ],
    );
  }

  buildError(Object error) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          pinned: true,
        ),
        SliverFillRemaining(
          child: Center(
            child: Result.error("Error", subtitle: error.toString()),
          ),
        )
      ],
    );
  }

  buildLoading() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          pinned: true,
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
            return buildError(snapshot.error.toString());
          }

          return buildLoading();
        },
      ),
    );
  }
}
