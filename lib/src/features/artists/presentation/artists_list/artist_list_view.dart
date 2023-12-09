import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/infinite_list_view.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_tile/artist_tile.dart';

/// A widget for display list of artists
class ArtistListView extends StatelessWidget {
  const ArtistListView({
    super.key,
    required this.artists,
    this.onSelect,
    this.onReachLastItem,
    this.emptyWidget = const SizedBox(),
  });

  /// List of artists to display.
  final List<Artist> artists;

  /// A callback function when user react to last item. Only worked on list view with vertical direction.
  final Function? onReachLastItem;

  final Function(Artist)? onSelect;

  /// A widget that display when songs is empty
  final Widget emptyWidget;

  @override
  Widget build(BuildContext context) {
    if (artists.isEmpty) {
      return emptyWidget;
    }

    return InfiniteListView(
      itemCount: artists.length,
      itemBuilder: (context, index) => ArtistTile(
        artist: artists[index],
        onTap: () {
          if (onSelect != null) {
            onSelect!(artists[index]);
          }
        },
      ),
      onReachLastItem: () {
        if (onReachLastItem != null) {
          onReachLastItem!();
        }
      },
    );
  }
}
