import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/event_series_bloc.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/models/release_event_series_model.dart';
import 'package:vocadb/pages/search/search_page.dart';
import 'package:vocadb/widgets/event_tile.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/section.dart';
import 'package:vocadb/widgets/space_divider.dart';
import 'package:vocadb/widgets/text_info_section.dart';
import 'package:vocadb/widgets/web_link_section.dart';

class EventSeriesScreenArguments {
  final ReleaseEventSeriesModel eventSeriesModel;

  EventSeriesScreenArguments(this.eventSeriesModel);
}

class EventSeriesScreen extends StatelessWidget {
  static const String routeName = '/eventSeriesDetail';

  static void navigate(BuildContext context, ReleaseEventSeriesModel eventSeriesModel) {
    Navigator.pushNamed(context, EventSeriesScreen.routeName,
        arguments: EventSeriesScreenArguments(eventSeriesModel));
  }

  @override
  Widget build(BuildContext context) {
    final EventSeriesScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final configBloc = Provider.of<ConfigBloc>(context);
    
    return Provider<EventSeriesBloc>(
      builder: (context) =>
          EventSeriesBloc(args.eventSeriesModel.id, configBloc: configBloc),
      dispose: (context, bloc) => bloc.dispose(),
      child: EventSeriesPage(eventSeriesModel: args.eventSeriesModel,),
    );
  }
}

class EventSeriesPage extends StatelessWidget {
  final ReleaseEventSeriesModel eventSeriesModel;

  const EventSeriesPage({Key key, this.eventSeriesModel})
      : super(key: key);

  buildData(BuildContext context, ReleaseEventSeriesModel releaseEventData) {
    
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
            title: Text(releaseEventData.name),
            background: (releaseEventData.imageUrl == null)
                ? Container()
                : CachedNetworkImage(
                      imageUrl: releaseEventData.imageUrl,
                      fit: BoxFit.contain,
                      placeholder: (context, url) =>
                          Container(color: Colors.grey),
                      errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
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
                          Share.share('$HOST/Es/${eventSeriesModel.id}'),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.share,
                          ),
                          Text(FlutterI18n.translate(context, 'label.share'), style: TextStyle(fontSize: 12))
                        ],
                      )),
                ),
                Expanded(
                  child: FlatButton(
                      onPressed: () {
                        launch('$HOST/Es/${eventSeriesModel.id}');
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
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextInfoSection(
                    title: FlutterI18n.translate(context, 'label.name'),
                    text: eventSeriesModel.name,
                  ),
                  TextInfoSection(
                    title: FlutterI18n.translate(context, 'label.category'),
                    text: FlutterI18n.translate(context,
                        'eventCategory.${eventSeriesModel.category}'),
                  ),
                  TextInfoSection(
                    title: FlutterI18n.translate(context, 'label.description'),
                    text: eventSeriesModel.description,
                  ),
                ],
              ),
            ),
            (releaseEventData.webLinks == null)? Container() : WebLinkSection(
                webLinks: releaseEventData.webLinks,
                title: FlutterI18n.translate(context, 'label.references')),
            (releaseEventData.events == null)? Container() : Section(
              title: FlutterI18n.translate(context, 'label.events'),
              children: releaseEventData.events
                        .map((e) => EventTile.fromReleaseEvent(e,
                            tag: 'even_series_event_${e.id}', showCategory: false, showImage: false))
                        .toList(),
            )
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
        stream: Provider.of<EventSeriesBloc>(context).eventSeriesDetail$,
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
