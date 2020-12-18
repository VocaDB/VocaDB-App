import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget for display list of songs as vertical or horizontal
class SongListView extends StatelessWidget {
  SongListView({Key key, this.songs, this.scrollDirection = Axis.vertical})
      : super(key: key);

  /// List of songs to display.
  final List<SongModel> songs;

  /// Default is vertical
  final Axis scrollDirection;

  /// Height of list content widget if set as horizontal.
  static const double _rowHeight = 180;

  /// Return item for display in verfical list
  Widget _verticalItemBuilder(BuildContext context, int index) {
    SongModel song = this.songs[index];
    return SongTile.song(song);
  }

  /// Return item for display in horizontal list
  Widget _horizontalItemBuilder(BuildContext context, int index) {
    SongModel song = this.songs[index];
    return SongCard.song(song);
  }

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
