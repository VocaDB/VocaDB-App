import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';

class ArtistWebLinksSection extends StatelessWidget {
  const ArtistWebLinksSection({super.key, required this.artist});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      visible: artist.webLinks.isNotEmpty,
      child: WebLinkGroupList(
        key: SongDetailScreen.webLinksKey,
        webLinks: artist.webLinks,
      ),
    );
  }
}
