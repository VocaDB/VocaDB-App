import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';

class ArtistBasicInfo extends StatelessWidget {
  const ArtistBasicInfo({super.key, required this.artist});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          artist.name!,
          style: Theme.of(context).textTheme.headline6,
        ),
        Visibility(
          visible: artist.additionalNames != null,
          child: Text(artist.additionalNames ?? ''),
        ),
        Text(artist.artistType ?? 'unknown type'),
      ],
    );
  }
}
