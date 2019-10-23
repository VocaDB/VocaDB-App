import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/youtube_playlist_bloc.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/pages/song_detail/song_detail_page.dart';
import 'package:vocadb/widgets/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlaylistScreenArguments {
  final String title;
  final List<SongModel> songs;

  YoutubePlaylistScreenArguments(this.songs, {this.title = 'Playlist'});
}

class YoutubePlaylistScreen extends StatelessWidget {
  static const String routeName = '/playlist';

  static void navigate(BuildContext context, List<SongModel> songs,
      {String title}) {
    Navigator.pushNamed(context, YoutubePlaylistScreen.routeName,
        arguments: YoutubePlaylistScreenArguments(songs, title: title));
  }

  @override
  Widget build(BuildContext context) {
    final YoutubePlaylistScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    return Provider<YoutubePlaylistBloc>(
      builder: (context) => YoutubePlaylistBloc(songs: args.songs),
      dispose: (context, bloc) => bloc.dispose(),
      child: YoutubePlaylistPage(title: args.title),
    );
  }
}

class YoutubePlaylistPage extends StatefulWidget {
  final String title;

  const YoutubePlaylistPage({Key key, this.title = 'Playlist'})
      : super(key: key);

  @override
  _YoutubePlaylistPageState createState() => _YoutubePlaylistPageState();
}

class _YoutubePlaylistPageState extends State<YoutubePlaylistPage> {
  buildPlaylist() {
    final bloc = Provider.of<YoutubePlaylistBloc>(context);
    return StreamBuilder(
      stream: Provider.of<YoutubePlaylistBloc>(context).currentIndexStream,
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: bloc.songs.length,
          itemBuilder: (BuildContext context, int index) {
            SongModel song = bloc.songs[index];
            return ListTile(
              onTap: () {
                Provider.of<YoutubePlaylistBloc>(context).select(index);
              },
              selected: snapshot.data == index,
              enabled: song.youtubePV != null,
              leading: Text((index + 1).toString()),
              title: Text(song.name, overflow: TextOverflow.ellipsis),
              subtitle:
                  Text(song.artistString, overflow: TextOverflow.ellipsis),
              trailing: PopupMenuButton<String>(
                onSelected: (String selectedValue) {
                  SongDetailScreen.navigateToSongDetail(context, song);
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'detail',
                    child: Text('View detail'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  buildDetail() {}

  buildPlayer() {
    final bloc = Provider.of<YoutubePlaylistBloc>(context);
    return StreamBuilder(
      stream: Provider.of<YoutubePlaylistBloc>(context).currentIndexStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        SongModel song = bloc.songs[snapshot.data];

        if (song.youtubePV == null) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Text('Player not available for this song.'),
            ),
          );
        }

        return VideoPlayer(
          url: song.youtubePV.url,
          onVideoEnded: () {
            Provider.of<YoutubePlaylistBloc>(context).next();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Column(
          children: <Widget>[
            buildPlayer(),
            Expanded(
              child: buildPlaylist(),
            )
          ],
        ),
      ),
    );
  }
}
