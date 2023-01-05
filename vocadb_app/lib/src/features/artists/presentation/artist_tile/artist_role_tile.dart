import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';

/// A widget for display artist role information in vertical list
class ArtistRoleTile extends StatelessWidget {
  const ArtistRoleTile({super.key, required this.artistRole, this.onTap});

  final ArtistRole artistRole;

  /// An artist image size both width and height
  static const double imageSize = 50;

  /// Callback when tap
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      // leading: SizedBox(
      //   width: imageSize,
      //   height: imageSize,
      //   child: ArtistTileImage(
      //     imageUrl: artistRole.imageUrl,
      //     artistId: artistRole.artistId,
      //   ),
      // ),
      title: Text(artistRole.artistName!, overflow: TextOverflow.ellipsis),
      subtitle: Text(artistRole.artistType!),
    );
  }
}
