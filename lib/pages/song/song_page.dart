import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/song_bloc.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/pages/search/search_song_filter_page.dart';
import 'package:vocadb/pages/youtube_playlist/youtube_playlist_page.dart';
import 'package:vocadb/widgets/center_content.dart';
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

    return Provider<SongBloc>(
      builder: (context) => SongBloc(configBloc: configBloc),
      dispose: (context, bloc) => bloc.dispose(),
      child: SongPage(),
    );
  }
}

class SongPage extends StatefulWidget {
  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  final TextEditingController _controller = TextEditingController();

  Widget buildData(List<SongModel> songs) {
    if (songs.length == 0) {
      return CenterResult(
        result: Result(
          Icon(Icons.search),
          'No result',
        ),
      );
    }

    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        SongModel song = songs[index];
        return SongTile.fromSong(song);
      },
    );
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
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
    final bloc = Provider.of<SongBloc>(context);

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
                    : Text('Songs'),
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
                          onPressed: () {
                            bloc.openSearch();
                          });
                }),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SearchSongFilterPage(bloc: bloc.songFilterBloc)));
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
        floatingActionButton: StreamBuilder(
          stream: bloc.result$,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }

            List<SongModel> songs = snapshot.data;

            if (songs.indexWhere((s) => s.youtubePV != null) >= 0) {
              return FloatingActionButton(
                onPressed: () => YoutubePlaylistScreen.navigate(context, songs),
                child: Icon(Icons.play_arrow),
              );
            }

            return Container();
          },
        ));
  }
}
