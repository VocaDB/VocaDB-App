import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';

class ArtistDetailImage extends ConsumerWidget {
  const ArtistDetailImage({super.key, required this.artist});

  final Artist artist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(flavorConfigProvider);
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: ClipOval(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8.0),
            child: CustomNetworkImage(
              (artist.imageUrl == null)
                  ? 'https://${config.apiAuthority}/Artist/Picture/${artist.id}'
                  : artist.imageUrl!,
              width: 130,
              height: 130,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
