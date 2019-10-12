import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/search_song_bloc.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/song_tile.dart';

class MoreSongScreenArguments {
  final String title;
  final Map<String, String> params;

  MoreSongScreenArguments(this.title, {this.params});
}

class MoreSongScreen extends StatelessWidget {
  static const String routeName = '/songs/more';

  static void navigate(BuildContext context, String title, {Map<String, String> params}) {
    Navigator.pushNamed(context, MoreSongScreen.routeName,
        arguments: MoreSongScreenArguments(title, params: params));
  }

  static void showLatestByArtist(BuildContext context, String title, int artistId) {
    Map<String, String> params = {
      'artistId': artistId.toString(),
      'sort': 'PublishDate',
      'fields': 'MainPicture,ThumbUrl,PVs',
      'maxResults': '50'
    };

    navigate(context, title, params: params);
  }

  static void showTopByArtist(BuildContext context, String title, int artistId) {
    Map<String, String> params = {
      'artistId': artistId.toString(),
      'sort': 'RatingScore',
      'fields': 'MainPicture,ThumbUrl,PVs',
      'maxResults': '50'
    };

    navigate(context, title, params: params);
  }

  @override
  Widget build(BuildContext context) {
    final MoreSongScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final configBloc = Provider.of<ConfigBloc>(context);

    return Provider<SearchSongBloc>(
      builder: (context) => SearchSongBloc(params: args.params, configBloc: configBloc),
      dispose: (context, bloc) => bloc.dispose(),
      child: MoreSongPage(title: args.title),
    );
  }
}

class MoreSongPage extends StatelessWidget {

  final String title;

  const MoreSongPage({Key key, this.title = 'More songs'}) : super(key: key);

  Widget buildData(List<SongModel> songs) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        SongModel song = songs[index];
        return SongTile.fromSong(song, tag: 'more_song_${song.id}');
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
    final bloc = Provider.of<SearchSongBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                onChanged: bloc.updateQuery,
                style: Theme.of(context).primaryTextTheme.title,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: title),
              ),
            ),
          ],
        ),
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
