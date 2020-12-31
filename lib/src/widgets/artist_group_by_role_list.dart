import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget display list of artists and grouping by role
class ArtistGroupByRoleList extends StatelessWidget {
  final List<ArtistRoleModel> artistRoles;

  final Function(ArtistRoleModel) onTap;

  const ArtistGroupByRoleList({@required this.artistRoles, this.onTap});

  ArtistGroupByRoleList.fromArtistSongModel(
      {@required List<ArtistSongModel> artistSongs, this.onTap})
      : artistRoles = artistSongs
            .map((e) => ArtistRoleModel(
                id: e.artistId,
                name: e.name,
                imageUrl: e.artistImageUrl,
                role: e.artistRole))
            .toList();

  ArtistGroupByRoleList.fromArtistAlbumModel(
      {@required List<ArtistAlbumModel> artistAlbums, this.onTap})
      : artistRoles = artistAlbums
            .map((e) => ArtistRoleModel(
                id: e.artistId,
                name: e.name,
                imageUrl: e.artistImageUrl,
                role: e.artistRole))
            .toList();

  List<Widget> _generateItems() {
    List<Widget> items = [];
    List<ArtistRoleModel> producers = [];
    List<ArtistRoleModel> vocalists = [];
    List<ArtistRoleModel> others = [];

    this.artistRoles.forEach((e) {
      if (e.isProducer) producers.add(e);
      if (e.isVocalist) vocalists.add(e);
      if (e.isOtherRole) others.add(e);
    });

    if (producers.isNotEmpty) {
      items.add(ListTile(
        title: Text('Producers'),
      ));
      items.addAll(producers.map(_mapArtistTile));
    }

    if (vocalists.isNotEmpty) {
      items.add(ListTile(
        title: Text('Vocalists'),
      ));
      items.addAll(vocalists.map(_mapArtistTile));
    }

    if (others.isNotEmpty) {
      items.add(ListTile(
        title: Text('Others'),
      ));
      items.addAll(others.map(_mapOtherArtistTile));
    }

    return items;
  }

  ArtistTile _mapArtistTile(ArtistRoleModel model) {
    return ArtistTile(
      name: model.name,
      imageUrl: model.imageUrl,
      onTap: () => this.onTap(model),
    );
  }

  ArtistTile _mapOtherArtistTile(ArtistRoleModel model) {
    return ArtistTile(
      name: model.name,
      subtitle: model.role,
      imageUrl: model.imageUrl,
      onTap: () => this.onTap(model),
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
