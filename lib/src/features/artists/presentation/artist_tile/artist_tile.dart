import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_tile/artist_tile_image.dart';

/// A widget for display artist information in vertical list
class ArtistTile extends StatelessWidget {
  const ArtistTile({super.key, required this.artist, this.onTap});

  final Artist artist;

  /// An artist image size both width and height
  static const double imageSize = 50;

  /// Callback when tap
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SizedBox(
        width: imageSize,
        height: imageSize,
        child: ArtistTileImage(
          imageUrl: artist.imageUrl,
          artistId: artist.id,
        ),
      ),
      title: Text(artist.name!, overflow: TextOverflow.ellipsis),
      subtitle: Text(artist.artistType ?? '<None>'),
    );
  }
}
