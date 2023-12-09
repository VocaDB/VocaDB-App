import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/text_info_tile.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';

class AlbumAdditionalInfo extends StatelessWidget {
  const AlbumAdditionalInfo({
    super.key,
    required this.album,
  });

  final Album album;

  @override
  Widget build(BuildContext context) {
    if (album.description == null &&
        album.catalogNumber == null &&
        album.releaseDate == null) {
      return Container();
    }

    return Column(
      children: [
        const Divider(),
        ListTile(
          title: Text('Information',
              style: Theme.of(context).textTheme.headline6!),
        ),
        TextInfoTile(
          title: 'Description',
          subtitle: album.description,
        ),
        TextInfoTile(
          title: 'Catalog number',
          subtitle: album.catalogNumber,
        ),
        TextInfoTile(
          title: 'Release date',
          subtitle: album.releaseDate?.formatted,
        ),
      ],
    );
  }
}
