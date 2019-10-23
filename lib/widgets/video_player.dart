import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatelessWidget {
  final String url;

  final Function onVideoEnded;

  const VideoPlayer({Key key, this.url, this.onVideoEnded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomYoutubePlayer(
      url: url,
      onVideoEnded: onVideoEnded,
    );
  }
}

class CustomYoutubePlayer extends StatelessWidget {
  final String url;

  final Function onVideoEnded;

  const CustomYoutubePlayer({Key key, this.url, this.onVideoEnded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _playerController = new YoutubePlayerController();

    return YoutubePlayer(
      context: context,
      videoId: YoutubePlayer.convertUrlToId(url),
      flags: YoutubePlayerFlags(
        autoPlay: false,
        showVideoProgressIndicator: true,
      ),
      onPlayerInitialized: (controller) {
        _playerController = controller;
        _playerController.addListener(() {
          PlayerState currentState = _playerController.value.playerState;

          if (currentState == PlayerState.ended && onVideoEnded != null) {
            onVideoEnded();
          }
        });
      },
    );
  }
}
