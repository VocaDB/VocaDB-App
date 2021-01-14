import 'package:flutter/material.dart';
import 'package:vocadb_app/widgets.dart';

class AlbumPlaceholderListView extends StatelessWidget {
  AlbumPlaceholderListView(
      {Key key, this.size = 10, this.scrollDirection = Axis.horizontal})
      : assert(size != null),
        super(key: key);

  /// Size of placeholders
  final int size;

  /// Direction to display
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
          itemCount: this.size,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => AlbumCardPlaceholder()),
    );
  }
}
