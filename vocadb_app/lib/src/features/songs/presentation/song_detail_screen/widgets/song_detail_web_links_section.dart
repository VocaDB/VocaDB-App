import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';

class SongDetailWebLinksSection extends StatelessWidget {
  const SongDetailWebLinksSection(
      {super.key, required this.song, this.onTapWebLink});

  final Song song;

  final Function(WebLink webLink)? onTapWebLink;

  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      visible: song.webLinks.isNotEmpty,
      child: WebLinkGroupList(
        key: SongDetailScreen.webLinksKey,
        webLinks: song.webLinks,
      ),
    );
  }
}
