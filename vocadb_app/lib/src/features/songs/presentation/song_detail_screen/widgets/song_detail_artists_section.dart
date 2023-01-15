import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_role_list.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class SongDetailArtistsSection extends StatelessWidget {
  const SongDetailArtistsSection({super.key, required this.song});

  final Song song;

  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      visible: song.artists.isNotEmpty,
      child: ArtistGroupByRoleList(
        key: SongDetailScreen.artistsKey,
        onTapArtist: (artist) => context.goArtist(artist.id),
        artistRoles: song.artists,
      ),
    );
  }
}
