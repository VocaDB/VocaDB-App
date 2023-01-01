import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/expandable_content.dart';
import 'package:vocadb_app/src/common_widgets/text_info_section.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_role_list.dart';

class AlbumAdditionalInfo extends StatelessWidget {
  const AlbumAdditionalInfo({
    super.key,
    required this.album,
  });

  final Album album;

  @override
  Widget build(BuildContext context) {
    return ExpandableContent(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextInfoSection(
              title: 'Name',
              text: album.name ?? '<None>',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextInfoSection(
              title: 'Description',
              text: album.description ?? '<None>',
            ),
          ),
          const Divider(),
          ArtistGroupByRoleList(
            onTapArtist: (artist) {},
            artistRoles: album.artists ?? [],
          ),
        ],
      ),
    );
  }
}
