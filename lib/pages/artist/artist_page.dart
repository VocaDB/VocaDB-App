import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/artist_bloc.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/pages/search/search_artist_filter_page.dart';
import 'package:vocadb/widgets/center_content.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/artist_tile.dart';

class ArtistScreenArguments {
  final bool openSearch;

  ArtistScreenArguments({this.openSearch});
}

class ArtistPage extends StatefulWidget {
  static const String routeName = '/artists';

  static void navigate(BuildContext context, {bool openSearch = false}) {
    Navigator.pushNamed(context, ArtistPage.routeName,
        arguments: ArtistScreenArguments(openSearch: openSearch));
  }

  @override
  _ArtistPageState createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final ArtistScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final artistBloc = Provider.of<ArtistBloc>(context);

    if (args.openSearch) {
      artistBloc.openSearch();
    }
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildData(List<ArtistModel> artists) {
    if (artists.length == 0) {
      return CenterResult(
        result: Result(
          Icon(Icons.person),
          FlutterI18n.translate(context, 'error.searchResultNotMatched'),
        ),
      );
    }

    return ListView.builder(
      itemCount: artists.length,
      itemBuilder: (context, index) {
        ArtistModel artist = artists[index];
        return ArtistTile.fromEntry(artist, tag: 'artist_${artist.id}');
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
    final bloc = Provider.of<ArtistBloc>(context);

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
                                border: InputBorder.none,
                                hintText: FlutterI18n.translate(
                                    context, 'label.search')),
                          ),
                        ),
                      ],
                    )
                  : Text(FlutterI18n.translate(context, 'label.artists')),
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
                          SearchArtistFilterPage(bloc: bloc.artistFilterBloc)));
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
