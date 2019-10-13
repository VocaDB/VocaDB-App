import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/release_event_bloc.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/pages/search/release_event_filter_page.dart';
import 'package:vocadb/widgets/center_content.dart';
import 'package:vocadb/widgets/event_tile.dart';
import 'package:vocadb/widgets/result.dart';

class ReleaseEventScreen extends StatelessWidget {
  static const String routeName = '/releaseEvents';

  static void navigate(BuildContext context) {
    Navigator.pushNamed(context, ReleaseEventScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final configBloc = Provider.of<ConfigBloc>(context);

    return Provider<ReleaseEventBloc>(
      builder: (context) => ReleaseEventBloc(configBloc: configBloc),
      dispose: (context, bloc) => bloc.dispose(),
      child: ReleaseEventPage(),
    );
  }
}

class ReleaseEventPage extends StatefulWidget {
  @override
  _ReleaseEventPageState createState() => _ReleaseEventPageState();
}

class _ReleaseEventPageState extends State<ReleaseEventPage> {
  final TextEditingController _controller = TextEditingController();

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildData(List<ReleaseEventModel> releaseEvents) {
    if (releaseEvents.length == 0) {
      return CenterResult(
        result: Result(
          Icon(Icons.event),
          'No result',
        ),
      );
    }

    return ListView.builder(
      itemCount: releaseEvents.length,
      itemBuilder: (context, index) {
        ReleaseEventModel e = releaseEvents[index];
        return EventTile.fromReleaseEvent(e, tag: 'release_event_${e.id}');
      },
    );
  }

  Widget buildLeading(String imageUrl) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ClipOval(
          child: Container(
        color: Colors.white,
        child: (imageUrl == null)
            ? Placeholder()
            : CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => Container(color: Colors.grey),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
      )),
    );
  }

  Widget buildError(String message) {
    return Center(
      child: Result.error("Something wrongs", subtitle: message),
    );
  }

  Widget buildDefault() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ReleaseEventBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: bloc.searching$,
          builder: (context, snapshot) {
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 100),
              child: (snapshot.hasData && snapshot.data)
                  ? Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            onChanged: bloc.updateQuery,
                            style: Theme.of(context).primaryTextTheme.title,
                            autofocus: true,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Search"),
                          ),
                        ),
                      ],
                    )
                  : Text('Release events'),
            );
          },
        ),
        actions: <Widget>[
          StreamBuilder(
              stream: bloc.searching$,
              builder: (context, snapshot) {
                return (snapshot.hasData && snapshot.data)
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          bloc.updateQuery('');
                          _controller.clear();
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () => bloc.openSearch(),
                      );
              }),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReleaseEventFilterPage(
                          bloc: bloc.releaseEventFilterBloc)));
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: bloc.result$,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildData(snapshot.data);
          } else if (snapshot.hasError) {
            return buildError(snapshot.error.toString());
          }

          return buildDefault();
        },
      ),
    );
  }
}
