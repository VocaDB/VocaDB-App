import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/constants/config.dart';

/// For display artist image base on given parameters
/// Display from `imageUrl` by default
/// if no imageUrl, then will use from website image by given `artistId`
/// if no both imageUrl and artistId. then use placeholder instead
class ArtistImageCard extends ConsumerWidget {
  const ArtistImageCard({super.key, this.imageUrl = '', this.artistId = 0});

  final String? imageUrl;

  final int? artistId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(flavorConfigProvider);
    return ClipOval(
      child: Container(
        color: Colors.white,
        child: CustomNetworkImage(
          (imageUrl != null && imageUrl!.isNotEmpty)
              ? imageUrl!
              : (artistId != null && artistId != 0)
                  ? 'https://${config.apiAuthority}/Artist/Picture/$artistId'
                  : kPlaceholderImageUrl,
          fit: BoxFit.contain,
          width: 72,
          height: 72,
        ),
      ),
    );
  }
}
