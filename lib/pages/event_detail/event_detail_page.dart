import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/release_event_detail_bloc.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/widgets/expandable_content.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/text_info_section.dart';
import 'package:vocadb/widgets/web_link_section.dart';

class ReleaseEventDetailScreenArguments {
  final int id;
  final String name;
  final String thumbUrl;
  final String tag;

  ReleaseEventDetailScreenArguments(this.id, this.name,
      {this.thumbUrl, this.tag});
}

class ReleaseEventDetailScreen extends StatelessWidget {
  static const String routeName = '/eventDetail';

  @override
  Widget build(BuildContext context) {
    final ReleaseEventDetailScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final configBloc = Provider.of<ConfigBloc>(context);

    return Provider<ReleaseEventDetailBloc>(
      builder: (context) =>
          ReleaseEventDetailBloc(args.id, configBloc: configBloc),
      dispose: (context, bloc) => bloc.dispose(),
      child: EventDetailPage(name: args.name, imageUrl: args.thumbUrl, tag: args.tag),
    );
  }
}

class EventDetailPage extends StatelessWidget {

  final String name;
  final String imageUrl;
  final String tag;

  const EventDetailPage({Key key, this.name, this.imageUrl, this.tag}) : super(key: key);

  List<Widget> buildContent() {
    return [Text('Expansion panel')];
  }

  buildData(BuildContext context, ReleaseEventModel releaseEvent) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("#" + releaseEvent.name),
            background: (releaseEvent.imageUrl == null)
                ? Container()
                : CachedNetworkImage(
                    imageUrl: releaseEvent.imageUrl,
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
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextInfoSection(
                    title: 'Name',
                    text: releaseEvent.additionalNames,
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
                      text: releaseEvent.description,
                    )
                  ],
                ),
              ),
            ),
            WebLinkSection(webLinks: releaseEvent.webLinks, title: "References")
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

  buildDefault(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("#" + this.name),
            background: (this.imageUrl == null)
                ? Container()
                : Hero(
                  tag: this.tag,
                  child: CachedNetworkImage(
                    imageUrl: this.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(color: Colors.grey),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),
                ) 
          ),
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
            return buildError(snapshot.error.toString());
          }

          return buildDefault(context);
        },
      ),
    );
  }
}
