import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/text_info_tile.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';

class ArtistAdditionalInfo extends StatelessWidget {
  const ArtistAdditionalInfo({super.key, required this.artist});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Information',
              style: Theme.of(context).textTheme.headline6!),
        ),
        TextInfoTile(
          title: 'Addition names',
          subtitle: artist.additionalNames,
        ),
        TextInfoTile(
          title: 'Type',
          subtitle: artist.artistType,
        ),
        TextInfoTile(
          title: 'Release date',
          subtitle: artist.releaseDateFormatted,
        ),
      ],
    );
  }
}
