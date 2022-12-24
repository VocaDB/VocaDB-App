import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';

/// A widget that displays simple information about album in card. Mostly use in horizontal list.
class AlbumCard extends StatelessWidget {
  /// A property that hold the album information
  final Album album;

  /// Callback when tap
  final GestureTapCallback onTap;

  /// The width of card
  static const double cardWidth = 130;

  /// The height of thumbnail image
  static const double imageHeight = 130;

  const AlbumCard({
    super.key,
    required this.album,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: cardWidth,
          margin: const EdgeInsets.only(right: Sizes.p8, left: Sizes.p8),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: imageHeight,
                color: Colors.black,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: CustomNetworkImage(
                    album.imageUrl,
                  ),
                ),
              ),
              gapH4,
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    album.name,
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
              gapH4,
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    album.artistString,
                    style: Theme.of(context).textTheme.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
