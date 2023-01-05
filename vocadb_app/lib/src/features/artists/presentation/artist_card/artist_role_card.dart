import 'package:flutter/material.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_card/artist_image_card.dart';

class ArtistRoleCard extends StatelessWidget {
  const ArtistRoleCard({
    super.key,
    required this.artistRole,
  });

  final ArtistRole artistRole;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: double.infinity,
      child: Column(
        children: [
          ArtistImageCard(
            imageUrl: artistRole.imageUrl,
            artistId: artistRole.artistId,
          ),
          gapH8,
          Text(artistRole.artistName ?? '<None>'),
          gapH4,
          Text(
            artistRole.artistRole ?? '<None>',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
