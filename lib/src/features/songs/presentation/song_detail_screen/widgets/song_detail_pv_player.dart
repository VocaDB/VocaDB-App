import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SongDetailPVPlayer extends ConsumerStatefulWidget {

  final Song song;

  const SongDetailPVPlayer({super.key, required this.song});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SongDetailPVPlayerState();
}

class _SongDetailPVPlayerState extends ConsumerState<SongDetailPVPlayer> {

  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    _youtubePlayerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.song.youtubeUrl!)!,
        flags: const YoutubePlayerFlags(
            mute: false,
            autoPlay: true,
        ),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _youtubePlayerController,
        ), 
      builder: (context, player) {
        return Column(
          children: [
            player,
          ],
        );
      });
  }

}