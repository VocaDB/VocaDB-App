import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/release_event_detail_bloc.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/pages/search/search_page.dart';
import 'package:vocadb/utils/analytic_constant.dart';
import 'package:vocadb/widgets/album_section.dart';
import 'package:vocadb/widgets/artist_section.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/song_list_section.dart';
import 'package:vocadb/widgets/space_divider.dart';
import 'package:vocadb/widgets/text_info_section.dart';
import 'package:vocadb/widgets/web_link_section.dart';

class ReleaseEventDetailScreenArguments {
  final int id;
  final String name;
  final String thumbUrl;
  final String tag;

  ReleaseEventDetailScreenArguments(this.id,
      {this.name, this.thumbUrl, this.tag});
}

class ReleaseEventDetailScreen extends StatelessWidget {
  static const String routeName = '/eventDetail';

  static void navigate(BuildContext context, int id,
      {String name, String thumbUrl, String tag}) {
    final analytics = Provider.of<FirebaseAnalytics>(context);
    analytics.logSelectContent(
        contentType: AnalyticContentType.releaseEvent, itemId: id.toString());

    Navigator.pushNamed(context, ReleaseEventDetailScreen.routeName,
        arguments: ReleaseEventDetailScreenArguments(id,
            name: name, thumbUrl: thumbUrl, tag: tag));
  }

  @override
  Widget build(BuildContext context) {
    final ReleaseEventDetailScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final configBloc = Provider.of<ConfigBloc>(context);

    return Provider<ReleaseEventDetailBloc>(
      builder: (context) =>
          ReleaseEventDetailBloc(args.id, configBloc: configBloc),
      dispose: (context, bloc) => bloc.dispose(),
      child: EventDetailPage(
          name: args.name, imageUrl: args.thumbUrl, tag: args.tag),
    );
  }
}

class EventDetailPage extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String tag;

  const EventDetailPage({Key key, this.name, this.imageUrl, this.tag})
      : super(key: key);

  List<Widget> buildContent() {
    return [Text('Expansion panel')];
  }

  buildData(BuildContext context, ReleaseEventModel releaseEvent) {
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
            title: Text(releaseEvent.name),
            background: (releaseEvent.imageUrl == null)
                ? Container()
                : Hero(
                    tag: this.tag,
                    child: CachedNetworkImage(
                      imageUrl: this.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Container(color: Colors.grey),
                      errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
                    ),
                  ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            SpaceDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                      onPressed: () =>
                          Share.share('$HOST/E/${releaseEvent.id}'),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.share,
                          ),
                          Text('Share', style: TextStyle(fontSize: 12))
                        ],
                      )),
                ),
                Expanded(
                  child: FlatButton(
                      onPressed: () {
                        launch('$HOST/E/${releaseEvent.id}');
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.info,
                          ),
                          Text(FlutterI18n.translate(context, 'label.showMore'),
                              style: TextStyle(fontSize: 12))
                        ],
                      )),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextInfoSection(
                    title: FlutterI18n.translate(context, 'label.name'),
                    text: releaseEvent.name,
                  ),
                  TextInfoSection(
                    title: FlutterI18n.translate(context, 'label.category'),
                    text: FlutterI18n.translate(context,
                        'eventCategory.${releaseEvent.displayCategory}'),
                  ),
                  TextInfoSection(
                    title: FlutterI18n.translate(context, 'label.date'),
                    text: releaseEvent.dateFormatted,
                  ),
                  TextInfoSection(
                    title: FlutterI18n.translate(context, 'label.venue'),
                    text: releaseEvent.venueName,
                  ),
                  TextInfoSection(
                    title: FlutterI18n.translate(context, 'label.description'),
                    text: releaseEvent.description,
                  ),
                ],
              ),
            ),
            Divider(),
            ArtistForEventSection(
              title:
                  FlutterI18n.translate(context, 'label.participatingArtists'),
              artists: releaseEvent.artists,
            ),
            (releaseEvent.artists.length == 0) ? Container() : Divider(),
            StreamBuilder(
              stream: Provider.of<ReleaseEventDetailBloc>(context).albums$,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();

                List<AlbumModel> albums = snapshot.data;

                if (albums.length == 0) return Container();

                return AlbumSection(
                  albums: albums,
                  tagPrefix: 'release_event_detail_${releaseEvent.id}',
                );
              },
            ),
            StreamBuilder(
              stream: Provider.of<ReleaseEventDetailBloc>(context).songs$,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();

                List<SongModel> songs = snapshot.data;

                if (songs.length == 0) return Container();

                return SongListSection(
                  title: FlutterI18n.translate(context, 'label.songs'),
                  songs: songs,
                  horizontal: true,
                  prefixTag: 'release_event_detail_songs_${releaseEvent.id}}',
                );
              },
            ),
            WebLinkSection(
                webLinks: releaseEvent.webLinks,
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

  buildDefault(BuildContext context) {
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
              title: Text(this.name),
              background: (this.imageUrl == null)
                  ? Container()
                  : Hero(
                      tag: this.tag,
                      child: CachedNetworkImage(
                        imageUrl: this.imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Container(color: Colors.grey),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      ),
                    )),
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
        stream: Provider.of<ReleaseEventDetailBloc>(context).releaseEvent$,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildData(context, snapshot.data);
          } else if (snapshot.hasError) {
            return buildError(context, snapshot.error.toString());
          }

          return buildDefault(context);
        },
      ),
    );
  }
}
