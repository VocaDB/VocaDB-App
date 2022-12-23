import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/infinite_list_view.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/song_card.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/song_placeholder_list_view.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/song_tile.dart';

/// A widget for display list of songs as vertical or horizontal
class SongListView extends StatelessWidget {
  const SongListView({
    super.key,
    required this.songs,
    required this.onSelect,
    this.emptyWidget = const SizedBox(),
    this.onReachLastItem,
    this.scrollDirection = Axis.vertical,
    this.displayPlaceholder = false,
  });

  /// List of songs to display.
  final List<Song> songs;

  /// Default is vertical
  final Axis scrollDirection;

  /// A callback function that called when user tap any item
  final void Function(Song) onSelect;

  /// A callback function when user react to last item. Only worked on list view with vertical direction.
  final Function? onReachLastItem;

  /// Set to True for display list of placeholders.
  final bool displayPlaceholder;

  /// A widget that display when songs is empty
  final Widget emptyWidget;

  /// Height of list content widget if set as horizontal.
  static const double _rowHeight = 180;

  /// Return item for display in vertical list
  Widget _verticalItemBuilder(BuildContext context, int index) => SongTile(
        song: songs[index],
        onTap: () => onSelect(songs[index]),
      );

  /// Return item for display in horizontal list
  Widget _horizontalItemBuilder(BuildContext context, int index) =>
      SongCard(song: songs[index], onTap: () => onSelect(songs[index]));

  @override
  Widget build(BuildContext context) {
    if (songs.isEmpty) {
      return emptyWidget;
    }

    if (scrollDirection == Axis.vertical) {
      return InfiniteListView(
        itemCount: songs.length,
        itemBuilder: _verticalItemBuilder,
        onReachLastItem: onReachLastItem,
      );
    }

    if (displayPlaceholder) {
      return const SongPlaceholderListView();
    }

    return SizedBox(
        height: _rowHeight,
        child: ListView.builder(
            itemCount: songs.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: _horizontalItemBuilder));
  }
}
