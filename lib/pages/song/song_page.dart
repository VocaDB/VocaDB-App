import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/search_song_bloc.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/song_tile.dart';

class SongScreen extends StatelessWidget {
  static const String routeName = '/songs';


  static void navigate(BuildContext context) {
    Navigator.pushNamed(context, SongScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final configBloc = Provider.of<ConfigBloc>(context);

    return Provider<SearchSongBloc>(
      builder: (context) => SearchSongBloc(configBloc: configBloc),
      dispose: (context, bloc) => bloc.dispose(),
      child: SongPage(),
    );
  }
}

class SongPage extends StatelessWidget {
 Widget buildData(List<SongModel> songs) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        SongModel song = songs[index];
        return SongTile.fromSong(song);
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

    final bloc = Provider.of<SearchSongBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                onChanged: bloc.updateQuery,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Search song"),
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