import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/search_album_bloc.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/album_tile.dart';

class MoreAlbumScreenArguments {
  final String title;
  final Map<String, String> params;

  MoreAlbumScreenArguments(this.title, {this.params});
}

class MoreAlbumScreen extends StatelessWidget {
  static const String routeName = '/albums/more';

  static void navigate(BuildContext context, String title,
      {Map<String, String> params}) {
    Navigator.pushNamed(context, MoreAlbumScreen.routeName,
        arguments: MoreAlbumScreenArguments(title, params: params));
  }

  static void showLatestByArtist(
      BuildContext context, String title, int artistId) {
    Map<String, String> params = {
      'artistId': artistId.toString(),
      'sort': 'ReleaseDate',
      'fields': 'MainPicture',
      'maxResults': '50'
    };

    navigate(context, title, params: params);
  }

  static void showTopByArtist(
      BuildContext context, String title, int artistId) {
    Map<String, String> params = {
      'artistId': artistId.toString(),
      'sort': 'RatingAverage',
      'fields': 'MainPicture',
      'maxResults': '50'
    };

    navigate(context, title, params: params);
  }

  @override
  Widget build(BuildContext context) {
    final MoreAlbumScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final configBloc = Provider.of<ConfigBloc>(context);

    return Provider<SearchAlbumBloc>(
      builder: (context) =>
          SearchAlbumBloc(params: args.params, configBloc: configBloc),
      dispose: (context, bloc) => bloc.dispose(),
      child: MoreAlbumPage(title: args.title),
    );
  }
}

class MoreAlbumPage extends StatelessWidget {
  final String title;

  const MoreAlbumPage({Key key, this.title = 'More albums'}) : super(key: key);

  Widget buildData(List<AlbumModel> albums) {
    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        AlbumModel album = albums[index];
        return AlbumTile.fromEntry(album, tag: 'more_album_${album.id}');
      },
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
        title: Text(title),
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
