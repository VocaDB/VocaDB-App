import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget for display list of songs as vertical or horizontal
class SongListView extends StatelessWidget {
  SongListView(
      {Key key,
      this.songs,
      this.scrollDirection = Axis.vertical,
      this.onSelect})
      : super(key: key);

  /// List of songs to display.
  final List<SongModel> songs;

  /// Default is vertical
  final Axis scrollDirection;

  /// A callback function that called when user tap any item
  final void Function(SongModel) onSelect;

  /// Height of list content widget if set as horizontal.
  static const double _rowHeight = 180;

  /// Return item for display in vertical list
  Widget _verticalItemBuilder(BuildContext context, int index) => SongTile.song(
        this.songs[index],
        onTap: () => this.onSelect(this.songs[index]),
      );

  /// Return item for display in horizontal list
  Widget _horizontalItemBuilder(BuildContext context, int index) =>
      SongCard.song(this.songs[index],
          onTap: () => this.onSelect(this.songs[index]));

  @override
  Widget build(BuildContext context) {
    if (this.scrollDirection == Axis.vertical) {
      return ListView.builder(
          itemCount: this.songs.length,
          scrollDirection: Axis.vertical,
          itemBuilder: _verticalItemBuilder);
    }

    return SizedBox(
        height: _rowHeight,
        child: ListView.builder(
            itemCount: this.songs.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: _horizontalItemBuilder));
  }
}
