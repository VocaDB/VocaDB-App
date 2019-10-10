import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/search_album_bloc.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/album_tile.dart';

class AlbumScreen extends StatelessWidget {
  static const String routeName = '/albums';

  static void navigate(BuildContext context) {
    Navigator.pushNamed(context, AlbumScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final configBloc = Provider.of<ConfigBloc>(context);

    return Provider<SearchAlbumBloc>(
      builder: (context) => SearchAlbumBloc(configBloc: configBloc),
      dispose: (context, bloc) => bloc.dispose(),
      child: AlbumPage(),
    );
  }
}

class AlbumPage extends StatelessWidget {
 Widget buildData(List<AlbumModel> albums) {
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

    final bloc = Provider.of<SearchAlbumBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
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