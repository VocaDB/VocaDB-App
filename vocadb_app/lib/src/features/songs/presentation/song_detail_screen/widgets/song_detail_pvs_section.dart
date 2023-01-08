import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/pvs/domain/pv.dart';
import 'package:vocadb_app/src/features/pvs/presentation/pv_list/pv_group_list.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen.dart';

class SongDetailPVsSection extends StatelessWidget {
  const SongDetailPVsSection({super.key, required this.song, this.onTapPV});

  final Song song;

  final Function(PV pv)? onTapPV;

  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      visible: song.pvs.isNotEmpty,
      child: PVGroupList(
        key: SongDetailScreen.pvsKey,
        pvs: song.pvs,
        searchQuery: song.pvSearchQuery,
        onTap: onTapPV,
      ),
    );
  }
}
