import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget for display list of artists
class ArtistListView extends StatelessWidget {
  ArtistListView({Key key, this.artists, this.onSelect, this.onReachLastItem})
      : super(key: key);

  /// List of artists to display.
  final List<ArtistModel> artists;

  /// A callback function when user react to last item. Only worked on list view with vertical direction.
  final Function onReachLastItem;

  final Function(ArtistModel) onSelect;

  @override
  Widget build(BuildContext context) {
    return InfiniteListView(
      itemCount: this.artists.length,
      itemBuilder: (context, index) => ArtistTile.fromEntry(this.artists[index],
          onTap: () => this.onSelect(this.artists[index])),
      onReachLastItem: this.onReachLastItem,
    );
  }
}
