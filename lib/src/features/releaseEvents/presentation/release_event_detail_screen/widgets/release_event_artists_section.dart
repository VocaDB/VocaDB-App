import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_role_list.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class ReleaseEventArtistsSection extends StatelessWidget {
  const ReleaseEventArtistsSection({super.key, required this.releaseEvent});

  final ReleaseEvent releaseEvent;

  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      title: 'Participating artists',
      visible: releaseEvent.artists != null && releaseEvent.artists!.isNotEmpty,
      child: ArtistGroupByRoleList(
        artistRoles: releaseEvent.artists ?? [],
        onTapArtist: context.goArtistDetail,
        displayRole: false,
      ),
    );
  }
}
