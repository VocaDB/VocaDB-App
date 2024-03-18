import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_like_button.dart';
import 'package:vocadb_app/src/utils/url_launcher.dart';

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
        SongDetailLikeButton(song: song),
        Visibility(
          visible: song.lyrics.isNotEmpty,
          child: TextButton(
            key: lyricBtnKey,
            onPressed: onTapLyricButton,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            child: const Column(
              children:  [
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
          child: const Column(
            children:  [
              Icon(Icons.share),
              gapH4,
              Text('Share'),
            ],
          ),
        ),
        Consumer(
          builder: (context, ref, _) {
            return TextButton(
            key: infoBtnKey,
            onPressed: () {
              ref.read(urlLauncherProvider).launchSongMoreInfo(song.id);
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            child: const Column(
              children:  [
                Icon(Icons.info),
                gapH4,
                Text('Info'),
              ],
            ),
          );
          },
        ),
      ],
    );
  }
}
