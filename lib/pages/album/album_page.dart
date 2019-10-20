import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/album_bloc.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/pages/search/search_album_filter_page.dart';
import 'package:vocadb/widgets/center_content.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/album_tile.dart';

class AlbumScreenArguments {
  final bool openSearch;

  AlbumScreenArguments({this.openSearch});
}

class AlbumScreen extends StatelessWidget {
  static const String routeName = '/albums';

  static void navigate(BuildContext context, {bool openSearch = false}) {
    Navigator.pushNamed(context, AlbumScreen.routeName,
        arguments: AlbumScreenArguments(openSearch: openSearch));
  }

  @override
  Widget build(BuildContext context) {
    final configBloc = Provider.of<ConfigBloc>(context);
    final AlbumScreenArguments args = ModalRoute.of(context).settings.arguments;
    final albumBloc = AlbumBloc(configBloc: configBloc);

    if (args.openSearch) {
      albumBloc.openSearch();
    }

    return Provider<AlbumBloc>(
      builder: (context) => albumBloc,
      dispose: (context, bloc) => bloc.dispose(),
      child: AlbumPage(),
    );
  }
}

class AlbumPage extends StatefulWidget {
  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  final TextEditingController _controller = TextEditingController();

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildData(List<AlbumModel> albums) {
    if (albums.length == 0) {
      return CenterResult(
        result: Result(
          Icon(Icons.album),
          FlutterI18n.translate(context, 'error.searchResultNotMatched'),
        ),
      );
    }

    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        AlbumModel album = albums[index];
        return AlbumTile.fromEntry(album, tag: 'album_${album.id}');
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
    final bloc = Provider.of<AlbumBloc>(context);

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
                  : Text(FlutterI18n.translate(context, 'label.albums')),
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
                      builder: (context) =>
                          SearchAlbumFilterPage(bloc: bloc.albumFilterBloc)));
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
