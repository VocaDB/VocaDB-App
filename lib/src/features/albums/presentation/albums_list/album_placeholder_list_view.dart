import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_card/album_card_placeholder.dart';

class AlbumPlaceholderListView extends StatelessWidget {
  const AlbumPlaceholderListView({
    super.key,
    this.size = 10,
    this.scrollDirection = Axis.horizontal,
  });

  /// Size of placeholders
  final int size;

  /// Direction to display
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: size,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const AlbumCardPlaceholder(),
      ),
    );
  }
}
