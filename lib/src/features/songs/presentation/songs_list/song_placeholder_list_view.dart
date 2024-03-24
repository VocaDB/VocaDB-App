import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_card/song_card_placeholder.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_tile/song_tile_placeholder.dart';

class SongPlaceholderListView extends StatelessWidget {
  const SongPlaceholderListView(
      {super.key, this.size = 10, this.scrollDirection = Axis.horizontal});

  /// Size of placeholders
  final int size;

  /// Direction to display
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    
    if(scrollDirection == Axis.vertical) {
     return ListView.builder(
      itemCount: size,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => const SongTilePlaceholder(),
     );
    }

    return SizedBox(
      height: 180,
      child: ListView.builder(
          itemCount: size,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const SongCardPlaceholder()),
    );
  }
}
