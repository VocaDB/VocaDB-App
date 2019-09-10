import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlaylistPage extends StatefulWidget {
  @override
  _YoutubePlaylistPageState createState() => _YoutubePlaylistPageState();
}

class _YoutubePlaylistPageState extends State<YoutubePlaylistPage> {

  String currentVideoId;

  String youtubeState;

  YoutubePlayerController _playerController;

  @override
  void initState() {
    super.initState();
    this.onChangeVideo("WiUjG9fF3zw");
    _playerController = new YoutubePlayerController();
    setState(() {
      youtubeState = "Unknown";
    });
  }

  onChangeVideo(String videoId) {
    setState(() {
      currentVideoId = videoId;
    });
  }

  isSelected(String videoId) {
    return videoId == this.currentVideoId;
  }

  playerControllerListen() {
    setState(() {
      youtubeState = _playerController.value.playerState.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            YoutubePlayer(
                context: context,
                videoId: this.currentVideoId,
                flags: YoutubePlayerFlags(
                  autoPlay: false,
                  showVideoProgressIndicator: true,
                ),    
                onPlayerInitialized: (controller) {
                  _playerController = controller;
                  _playerController.addListener(playerControllerListen);
                },
            ),
            Container(
              height: 100,
              child: Center(
                child: Text(this.youtubeState),
              ),
            ),
            ListTile(
              title: Text("1 - ビバハピ"),
              selected: isSelected("WiUjG9fF3zw"),
              onTap: () {
                this.onChangeVideo("WiUjG9fF3zw");
              },
            ),
            ListTile(
              title: Text("2 - Tell Your World"),
              selected: isSelected("PqJNc9KVIZE"),
              onTap: () {
                this.onChangeVideo("PqJNc9KVIZE");
              },
            ),
            ListTile(
              title: Text("3 - ODDS&ENDS"),
              selected: isSelected("6OmwKZ9r07o"),
              onTap: () {
                this.onChangeVideo("6OmwKZ9r07o");
              },
            )
          ],
        ),
      ),
    );
  }
}