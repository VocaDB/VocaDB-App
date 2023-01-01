import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/common_widgets/space_divider.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_type_icon/song_type_icon.dart';

// A widget for display song information in vertical list
class SongTile extends StatelessWidget {
  /// A property that hold the song information
  final Song song;

  /// Callback when tap
  final GestureTapCallback onTap;

  /// A widget that display on leftmost side
  final Widget leading;

  /// The height of widget
  static const double height = 100;

  /// The width of thumbnail
  static const double thumbnailWidth = 120;

  const SongTile({
    super.key,
    required this.song,
    required this.onTap,
    this.leading = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(Sizes.p16),
              child: leading,
            ),
            Padding(
              padding: const EdgeInsets.all(Sizes.p8),
              child: SizedBox(
                width: thumbnailWidth,
                child: (song.imageUrl!.isNotEmpty)
                    ? CustomNetworkImage(
                        song.imageUrl!,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.music_note),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(song.name!, overflow: TextOverflow.ellipsis),
                    Text(song.artistString!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.caption),
                    const SpaceDivider(Sizes.p8),
                    Row(
                      children: <Widget>[
                        SongTypeIcon(
                          songType: song.songType!,
                        ),
                        (song.pvServices!.isNotEmpty)
                            ? const Icon(Icons.local_movies)
                            : Container()
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
