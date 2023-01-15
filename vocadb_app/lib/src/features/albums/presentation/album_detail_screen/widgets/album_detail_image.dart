import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';

class AlbumDetailImage extends ConsumerWidget {
  const AlbumDetailImage({super.key, required this.album});

  final Album album;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(flavorConfigProvider);
    final imageUrl = (album.imageUrl == null)
        ? 'https://${config.apiAuthority}/Album/CoverPicture/${album.id}'
        : album.imageUrl!;

    return SizedBox(
      width: 260,
      height: 260,
      child: CustomNetworkImage(
        imageUrl,
        fit: BoxFit.contain,
      ),
    );
  }
}
