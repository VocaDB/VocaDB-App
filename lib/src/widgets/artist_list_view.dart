import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget for display list of artists
class ArtistListView extends StatelessWidget {
  ArtistListView({Key key, this.artists, this.onSelect}) : super(key: key);

  /// List of artists to display.
  final List<ArtistModel> artists;

  final Function(ArtistModel) onSelect;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.artists.length,
        itemBuilder: (context, index) => ArtistTile.fromEntry(
            this.artists[index],
            onTap: () => this.onSelect(this.artists[index])));
  }
}
