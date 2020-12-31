import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget for display list of artists by using [Column] widget.
class ArtistColumnView extends StatelessWidget {
  ArtistColumnView({Key key, this.artists}) : super(key: key);

  /// List of artists to display.
  final List<ArtistModel> artists;

  @override
  Widget build(BuildContext context) {
    return Column(
        children:
            this.artists.map<Widget>((e) => ArtistTile.fromEntry(e)).toList());
  }
}
