import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_tile/artist_tile.dart';

//TODO Change to horizontal view
class ArtistsHorizontalListView extends StatelessWidget {
  const ArtistsHorizontalListView({
    super.key,
    required this.artists,
    this.onSelect,
  });

  /// List of artists to display.
  final List<Artist> artists;

  final Function(Artist?)? onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: artists
            .map<Widget>((e) => ArtistTile(
                  artist: e,
                  onTap: () => {},
                ))
            .toList());
  }
}
