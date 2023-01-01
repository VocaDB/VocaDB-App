import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';

/// A widget for display album information in vertical list
class AlbumTile extends StatelessWidget {
  /// A property that hold the album information
  final Album album;

  /// Callback when tap
  final GestureTapCallback onTap;

  /// Album image size both width and height
  static const double imageSize = 50;

  const AlbumTile({
    super.key,
    required this.album,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SizedBox(
        width: imageSize,
        height: imageSize,
        child: CustomNetworkImage(
          album.imageUrl!,
          fit: BoxFit.fill,
        ),
      ),
      title: Text(album.name!, overflow: TextOverflow.ellipsis),
      subtitle: Text(album.artistString!, overflow: TextOverflow.ellipsis),
    );
  }
}
