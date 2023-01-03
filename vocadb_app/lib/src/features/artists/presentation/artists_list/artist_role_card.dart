import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';

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
          ClipOval(
            child: Container(
              color: Colors.white,
              child: CustomNetworkImage(
                artistRole.imageUrl,
                width: 72,
                height: 72,
                fit: BoxFit.contain,
              ),
            ),
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
