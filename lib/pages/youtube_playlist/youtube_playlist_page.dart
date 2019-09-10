import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlaylistPage extends StatefulWidget {
  @override
  _YoutubePlaylistPageState createState() => _YoutubePlaylistPageState();
}

class _YoutubePlaylistPageState extends State<YoutubePlaylistPage> {

  String currentVideoId;

  String youtubeState;

  int currentVideoIndex = 0;

  YoutubePlayerController _playerController;

  PV activeVideo;

  List<PV> videoList = [
    new PV("1 - ビバハピ", "WiUjG9fF3zw"),
    new PV("2 - Tell Your World", "PqJNc9KVIZE"),
    new PV("3 - ODDS&ENDS", "6OmwKZ9r07o"),
  ];

  @override
  void initState() {
    super.initState();
    _playerController = new YoutubePlayerController();
    setState(() {
      youtubeState = "Unknown";
      activeVideo = videoList[0];
    });
  }

  onChangeVideo(int videoIndex) {
    setState(() {
      activeVideo = videoList[videoIndex];
      currentVideoIndex = videoIndex;
    });
  }

  isSelected(int videoIndex) {
    return videoIndex == this.currentVideoIndex;
  }

  prev() {
    if(this.currentVideoIndex > 0) {
      onChangeVideo(this.currentVideoIndex-1);
    } else {
      onChangeVideo(2);
    }
  }

  next() {
    if(this.currentVideoIndex < 2) {
      onChangeVideo(this.currentVideoIndex+1);
    } else {
      onChangeVideo(0);
    }
  }

  playerControllerListen() {

    PlayerState currentState = _playerController.value.playerState;

    if(currentState == PlayerState.ENDED) {
      this.next();
    }
    
    setState(() {
      youtubeState = currentState.toString();
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
                videoId: this.activeVideo.videoId,
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
             Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: this.prev,
                    child: Icon(Icons.skip_previous)
                  ),
                  FlatButton(
                    onPressed: this.next,
                    child: Icon(Icons.skip_next)
                  )
                ],
              ),
            ),
            ListTile(
              title: Text("1 - ビバハピ"),
              selected: isSelected(0),
              onTap: () {
                this.onChangeVideo(0);
              },
            ),
            ListTile(
              title: Text("2 - Tell Your World"),
              selected: isSelected(1),
              onTap: () {
                this.onChangeVideo(1);
              },
            ),
            ListTile(
              title: Text("3 - ODDS&ENDS"),
              selected: isSelected(2),
              onTap: () {
                this.onChangeVideo(2);
              },
            )
          ],
        ),
      ),
    );
  }
}

class PV {

  String name;

  String videoId;

  PV(String name, String videoId) : this.name = name, this.videoId = videoId;
}