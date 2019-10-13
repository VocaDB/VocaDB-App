import 'package:flutter/material.dart';
import 'package:vocadb/blocs/youtube_playlist_bloc.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlaylistPage extends StatefulWidget {
  final List<SongModel> songs;

  const YoutubePlaylistPage({Key key, this.songs}) : super(key: key);

  static navigate(BuildContext context, List<SongModel> songs) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => YoutubePlaylistPage(songs: songs)));
  }

  @override
  _YoutubePlaylistPageState createState() => _YoutubePlaylistPageState();
}

class _YoutubePlaylistPageState extends State<YoutubePlaylistPage> {
  YoutubePlayerController _playerController;
  YoutubePlaylistBloc bloc;

  @override
  void initState() {
    super.initState();
    _playerController = new YoutubePlayerController();
    bloc = YoutubePlaylistBloc();
    bloc.updatePlaylist(widget.songs);
  }

  playerControllerListen() {
    PlayerState currentState = _playerController.value.playerState;

    if (currentState == PlayerState.ENDED) {
      bloc.next();
    }
  }

  buildPlaylist() {
    return StreamBuilder(
      stream: bloc.currentIndexStream,
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: widget.songs.length,
          itemBuilder: (BuildContext context, int index) {
            SongModel song = widget.songs[index];
            return ListTile(
              onTap: () {
                bloc.select(index);
              },
              selected: snapshot.data == index,
              enabled: song.youtubePV != null,
              leading: Text((index + 1).toString()),
              title: Text(song.name),
              subtitle: Text(song.artistString),
            );
          },
        );
      },
    );
  }

  buildPlayer() {
    return StreamBuilder(
      stream: bloc.currentIndexStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        SongModel song = widget.songs[snapshot.data];

        if (song.youtubePV == null) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Text('Player not available for this song.'),
            ),
          );
        }

        return YoutubePlayer(
          context: context,
          videoId: YoutubePlayer.convertUrlToId(song.youtubePV.url),
          flags: YoutubePlayerFlags(
            autoPlay: false,
            showVideoProgressIndicator: true,
          ),
          onPlayerInitialized: (controller) {
            _playerController = controller;
            _playerController.addListener(playerControllerListen);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Playlist')),
        body: Column(
          children: <Widget>[
            buildPlayer(),
            Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                      onPressed: bloc.prev, child: Icon(Icons.skip_previous)),
                  FlatButton(onPressed: bloc.next, child: Icon(Icons.skip_next))
                ],
              ),
            ),
            Expanded(
              child: buildPlaylist(),
            )
          ],
        ),
      ),
    );
  }
}
