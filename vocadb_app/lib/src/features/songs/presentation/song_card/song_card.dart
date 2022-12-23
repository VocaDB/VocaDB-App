import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/common_widgets/space_divider.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_type_icon/song_type_icon.dart';

/// A widget that displays simple information about song in card. Mostly use in horizontal list.
class SongCard extends StatelessWidget {
  /// A property that hold the song information
  final Song song;

  /// Callback when tap
  final GestureTapCallback onTap;

  /// The width of card
  static const double cardWidth = 130;

  /// The height of thumbnail image
  static const double thumbnailHeight = 100;

  const SongCard({super.key, required this.song, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: cardWidth,
          margin: const EdgeInsets.only(right: 8.0, left: 8.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: thumbnailHeight,
                color: Colors.black,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: CustomNetworkImage(
                    song.imageUrl,
                  ),
                ),
              ),
              const SpaceDivider.micro(),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(song.name,
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ),
              const SpaceDivider.micro(),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(song.artistString,
                    style: Theme.of(context).textTheme.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ),
              const SpaceDivider.micro(),
              Row(
                children: <Widget>[
                  SongTypeIcon(
                    songType: song.songType,
                  ),
                  (song.pvServices.isNotEmpty)
                      ? const Icon(Icons.local_movies)
                      : Container(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
