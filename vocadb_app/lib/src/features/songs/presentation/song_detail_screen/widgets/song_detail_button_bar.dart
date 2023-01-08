import 'package:flutter/material.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

class SongDetailButtonBar extends StatelessWidget {
  const SongDetailButtonBar(
      {super.key, this.onTapLyricButton, required this.song});

  static const likeBtnKey = Key('song-detail-like-btn-key');
  static const lyricBtnKey = Key('song-detail-lyric-btn-key');
  static const shareBtnKey = Key('song-detail-share-btn-key');
  static const infoBtnKey = Key('song-detail-info-btn-key');

  final VoidCallback? onTapLyricButton;
  final Song song;

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          key: likeBtnKey,
          onPressed: () => {},
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Column(
            children: const [
              Icon(Icons.favorite),
              gapH4,
              Text('Like'),
            ],
          ),
        ),
        Visibility(
          visible: song.lyrics.isNotEmpty,
          child: TextButton(
            key: lyricBtnKey,
            onPressed: onTapLyricButton,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            child: Column(
              children: const [
                Icon(Icons.subtitles),
                gapH4,
                Text('Lyrics'),
              ],
            ),
          ),
        ),
        TextButton(
          key: shareBtnKey,
          onPressed: () => {},
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Column(
            children: const [
              Icon(Icons.share),
              gapH4,
              Text('Share'),
            ],
          ),
        ),
        TextButton(
          key: infoBtnKey,
          onPressed: () => {},
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Column(
            children: const [
              Icon(Icons.info),
              gapH4,
              Text('Info'),
            ],
          ),
        ),
      ],
    );
  }
}
