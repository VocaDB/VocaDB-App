import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';

class AlbumDetailImage extends StatelessWidget {
  const AlbumDetailImage({super.key, required this.album});

  final Album album;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      height: 260,
      child: CustomNetworkImage(
        album.imageUrl!,
        fit: BoxFit.contain,
      ),
    );
  }
}
