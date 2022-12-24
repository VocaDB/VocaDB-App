import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/infinite_list_view.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_card/album_card.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_tile/album_tile.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/album_placeholder_list_view.dart';

/// A widget for display list of songs as vertical or horizontal
class AlbumListView extends StatelessWidget {
  const AlbumListView({
    super.key,
    required this.albums,
    required this.onSelect,
    this.onReachLastItem,
    this.emptyWidget = const SizedBox(),
    this.scrollDirection = Axis.vertical,
    this.displayPlaceholder = false,
  });

  /// List of songs to display.
  final List<Album> albums;

  /// Default is vertical
  final Axis scrollDirection;

  /// A callback function when user react to last item. Only worked on list view with vertical direction.
  final Function? onReachLastItem;

  /// Set to True for display list of placeholders.
  final bool displayPlaceholder;

  /// A callback function that called when user tap any item
  final void Function(Album) onSelect;

  /// Height of list content widget if set as horizontal.
  static const double _rowHeight = 180;

  /// A widget that display when songs is empty
  final Widget emptyWidget;

  /// Return item for display in vertical list
  Widget _verticalItemBuilder(BuildContext context, int index) => AlbumTile(
        album: albums[index],
        onTap: () => onSelect(albums[index]),
      );

  /// Return item for display in horizontal list
  Widget _horizontalItemBuilder(BuildContext context, int index) => AlbumCard(
        album: albums[index],
        onTap: () => onSelect(albums[index]),
      );

  @override
  Widget build(BuildContext context) {
    if (albums.isEmpty) {
      return emptyWidget;
    }

    if (scrollDirection == Axis.vertical) {
      return InfiniteListView(
        itemCount: albums.length,
        itemBuilder: _verticalItemBuilder,
        onReachLastItem: onReachLastItem,
      );
    }

    if (displayPlaceholder) {
      return const AlbumPlaceholderListView();
    }

    return SizedBox(
      height: _rowHeight,
      child: ListView.builder(
        itemCount: albums.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: _horizontalItemBuilder,
      ),
    );
  }
}
