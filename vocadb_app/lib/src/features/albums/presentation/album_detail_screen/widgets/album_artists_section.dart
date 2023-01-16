import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_roles_horizontal_list_view.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class AlbumArtistsSection extends StatelessWidget {
  const AlbumArtistsSection({super.key, required this.album});

  final Album album;

  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      visible: album.artists.isNotEmpty,
      title: 'Artists',
      child: ArtistRolesHorizontalListView(
        artists: album.artists,
        onSelect: (artistRole) {
          if (artistRole.artist != null) {
            context.goArtistDetail(artistRole.artist!);
          }
        },
      ),
    );
  }
}
