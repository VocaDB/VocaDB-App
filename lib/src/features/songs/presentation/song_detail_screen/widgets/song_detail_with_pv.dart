
import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_albums_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_artists_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_button_bar.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_content.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_derived_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_info_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_pv_player.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_pvs_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_related_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_tags_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_web_links_section.dart';

class SongDetailWithPV extends StatelessWidget {
  final Song song;

  final Widget? pvPlayerWidget;

  final VoidCallback? onTapLyricButton;

  const SongDetailWithPV({super.key, required this.song, this.pvPlayerWidget, this.onTapLyricButton});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      pvPlayerWidget ?? SongDetailPVPlayer(song: song),
      SongDetailContent(song: song, onTapLyricButton: onTapLyricButton),
    ]);
  }
}
