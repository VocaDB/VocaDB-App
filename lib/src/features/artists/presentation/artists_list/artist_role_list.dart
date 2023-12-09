import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_tile/artist_role_tile.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_tile/artist_tile.dart';

/// A widget display list of artists and grouping by role
class ArtistGroupByRoleList extends StatelessWidget {
  const ArtistGroupByRoleList({
    super.key,
    required this.artistRoles,
    this.onTapArtist,
    this.displayRole = true,
  });

  final List<ArtistRole> artistRoles;

  final Function(Artist)? onTapArtist;

  final bool displayRole;

  List<Widget> _generateItems() {
    List<Widget> items = [];
    List<ArtistRole> producers = [];
    List<ArtistRole> vocalists = [];
    List<ArtistRole> others = [];

    for (var e in artistRoles) {
      if (e.isProducer) producers.add(e);
      if (e.isVocalist) vocalists.add(e);
      if (e.isOtherRole) others.add(e);
    }

    if (producers.isNotEmpty) {
      if (displayRole) {
        items.add(const ListTile(
          title: Text('Producers'),
        ));
      }
      items.addAll(producers.map(_mapArtistTile));
    }

    if (vocalists.isNotEmpty) {
      if (displayRole) {
        items.add(const ListTile(
          title: Text('Vocalists'),
        ));
      }
      items.addAll(vocalists.map(_mapArtistTile));
    }

    if (others.isNotEmpty) {
      if (displayRole) {
        items.add(const ListTile(
          title: Text('Others'),
        ));
      }
      items.addAll(others.map(_mapOtherArtistTile));
    }

    return items;
  }

  ArtistTile _mapArtistTile(ArtistRole artistRole) {
    return ArtistTile(
      artist: artistRole.artist!,
      onTap: () => onTapArtist?.call(artistRole.artist!),
    );
  }

  ArtistRoleTile _mapOtherArtistTile(ArtistRole artistRole) {
    return ArtistRoleTile(
      artistRole: artistRole,
      onTap: () => (artistRole.artist != null)
          ? onTapArtist?.call(artistRole.artist!)
          : {},
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
