import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_link.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_tile/artist_tile.dart';

/// A widget display list of artists and grouping by link type
class ArtistLinkListView extends StatelessWidget {
  final List<ArtistLink> artistLinks;

  final Function(Artist)? onSelect;

  /// For translation label.
  final bool reverse;

  const ArtistLinkListView(
      {super.key,
      required this.artistLinks,
      this.onSelect,
      this.reverse = false});

  List<Widget> _generateItems() {
    List<Widget> items = [];

    final groups = ArtistLinkList(artistLinks).groupByLinkType;

    // TODO Translation by artist role
    groups.forEach((linkType, artistLinkList) {
      String label =
          (reverse) ? 'artistReverseRole.$linkType' : 'artistRole.$linkType';
      items.add(_buildHeader(label));
      items.addAll(artistLinkList.map<Widget>(_mapArtistLinkTile).toList());
    });

    return items;
  }

  Widget _buildHeader(String title) {
    return ListTile(
      title: Text(title),
    );
  }

  ArtistTile _mapArtistLinkTile(ArtistLink model) {
    return ArtistTile(
      artist: model.artist,
      onTap: () {
        if (onSelect != null) {
          onSelect!(model.artist);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = _generateItems();

    return Column(
      children: items,
    );
  }
}
