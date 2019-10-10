import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/search_artist_bloc.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/artist_tile.dart';

class ArtistScreen extends StatelessWidget {
  static const String routeName = '/artists';

  static void navigate(BuildContext context) {
    Navigator.pushNamed(context, ArtistScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final configBloc = Provider.of<ConfigBloc>(context);

    return Provider<SearchArtistBloc>(
      builder: (context) => SearchArtistBloc(configBloc: configBloc),
      dispose: (context, bloc) => bloc.dispose(),
      child: ArtistPage(),
    );
  }
}

class ArtistPage extends StatelessWidget {
 Widget buildData(List<ArtistModel> artists) {
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

    final bloc = Provider.of<SearchArtistBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Artists'),
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