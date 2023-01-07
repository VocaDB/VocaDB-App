import 'package:flutter/material.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';

class SongDetailButtonBar extends StatelessWidget {
  const SongDetailButtonBar({super.key});

  static const likeBtnKey = Key('song-detail-like-btn-key');
  static const lyricBtnKey = Key('song-detail-lyric-btn-key');
  static const shareBtnKey = Key('song-detail-share-btn-key');
  static const infoBtnKey = Key('song-detail-info-btn-key');

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
        TextButton(
          key: lyricBtnKey,
          onPressed: () => {},
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
