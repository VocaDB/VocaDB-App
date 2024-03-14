import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_albums_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_artists_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_button_bar.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_derived_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_info_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_pvs_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_related_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_tags_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_web_links_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_hero_image.dart';

class SongDetailContent extends StatelessWidget {
  const SongDetailContent(
      {super.key, required this.song, this.onTapLyricButton});

  final Song song;

  final VoidCallback? onTapLyricButton;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        key: SongDetailScreen.songDetailScrollKey,
        children: [
          SongDetailButtonBar(
            song: song,
            onTapLyricButton: onTapLyricButton,
          ),
          SongDetailInfoSection(song: song),
          SongDetailTagsSection(song: song),
          SongDetailArtistsSection(song: song),
          SongDetailPVsSection(song: song),
          SongDetailAlbumsSection(song: song),
          SongDetailDerivedSongsSection(song: song),
          SongDetailRelatedSection(song: song),
          SongDetailWebLinksSection(song: song),
        ],
      ),
    );
  }
}
