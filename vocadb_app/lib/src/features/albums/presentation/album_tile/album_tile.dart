import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_tile/album_image_tile.dart';

/// A widget for display album information in vertical list
class AlbumTile extends StatelessWidget {
  /// A property that hold the album information
  final Album album;

  /// Callback when tap
  final GestureTapCallback onTap;

  const AlbumTile({
    super.key,
    required this.album,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: AlbumImageTile(imageUrl: album.imageUrl, albumId: album.id),
      title: Text(album.name!, overflow: TextOverflow.ellipsis),
      subtitle: Text(album.artistString!, overflow: TextOverflow.ellipsis),
    );
  }
}
