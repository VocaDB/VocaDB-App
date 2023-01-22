import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_songs_list.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class ReleaseEventSongsSection extends StatelessWidget {
  const ReleaseEventSongsSection({super.key, required this.releaseEvent});

  final ReleaseEvent releaseEvent;

  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      title: 'Songs',
      visible: true,
      child: SongListView(
        scrollDirection: Axis.horizontal,
        songs: kFakeSongsList,
        onSelect: context.goSongDetail,
      ),
    );
  }
}
