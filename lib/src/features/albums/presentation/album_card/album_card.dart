import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_card/album_image_card.dart';

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
    return Card(
      child: InkWell(
        onTap: () {
          onTap.call();
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            AlbumImageCard(
              imageUrl: album.imageUrl,
              albumId: album.id,
            ),
            SizedBox(
              width: 160,
              height: 42,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    album.name ?? '<None>',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
