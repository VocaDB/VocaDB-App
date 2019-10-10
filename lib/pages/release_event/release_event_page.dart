import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/search_release_event_bloc.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/widgets/event_tile.dart';
import 'package:vocadb/widgets/result.dart';

class ReleaseEventScreen extends StatelessWidget {
  static const String routeName = '/releaseEvents';

  static void navigate(BuildContext context) {
    Navigator.pushNamed(context, ReleaseEventScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Provider<SearchReleaseEventBloc>(
      builder: (context) => SearchReleaseEventBloc(),
      dispose: (context, bloc) => bloc.dispose(),
      child: ReleaseEventPage(),
    );
  }
}

class ReleaseEventPage extends StatelessWidget {
 Widget buildData(List<ReleaseEventModel> releaseEvents) {
    return ListView.builder(
      itemCount: releaseEvents.length,
      itemBuilder: (context, index) {
        ReleaseEventModel e = releaseEvents[index];
        return EventTile.fromEntry(e, tag: 'release_event_${e.id}');
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

    final bloc = Provider.of<SearchReleaseEventBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Release events'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
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