import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/constants/config.dart';

/// For display album image base on given parameters
/// Display from `imageUrl` by default
/// if no imageUrl, then will use from website image by given `albumId`
/// if no both imageUrl and albumId. then use placeholder instead
class AlbumImageTile extends ConsumerWidget {
  const AlbumImageTile({super.key, this.imageUrl = '', this.albumId = 0});

  final String? imageUrl;

  final int? albumId;

  /// Album image size both width and height
  static const double imageSize = 50;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(flavorConfigProvider);
    return SizedBox(
      width: imageSize,
      height: imageSize,
      child: CustomNetworkImage(
        (imageUrl != null && imageUrl!.isNotEmpty)
            ? imageUrl!
            : (albumId != null && albumId != 0)
                ? 'https://${config.apiAuthority}/Album/CoverPicture/$albumId'
                : kPlaceholderImageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
