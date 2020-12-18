import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget for display list of songs as vertical or horizontal
class AlbumListView extends StatelessWidget {
  AlbumListView({Key key, this.albums, this.scrollDirection = Axis.vertical})
      : super(key: key);

  /// List of songs to display.
  final List<AlbumModel> albums;

  /// Default is vertical
  final Axis scrollDirection;

  /// Height of list content widget if set as horizontal.
  static const double _rowHeight = 180;

  /// Return item for display in vertical list
  Widget _verticalItemBuilder(BuildContext context, int index) =>
      AlbumTile.fromEntry(this.albums[index]);

  /// Return item for display in horizontal list
  Widget _horizontalItemBuilder(BuildContext context, int index) =>
      AlbumCard.album(this.albums[index]);

  @override
  Widget build(BuildContext context) {
    if (this.scrollDirection == Axis.vertical) {
      return ListView.builder(
          itemCount: this.albums.length,
          scrollDirection: Axis.vertical,
          itemBuilder: _verticalItemBuilder);
    }

    return SizedBox(
        height: _rowHeight,
        child: ListView.builder(
            itemCount: this.albums.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: _horizontalItemBuilder));
  }
}
