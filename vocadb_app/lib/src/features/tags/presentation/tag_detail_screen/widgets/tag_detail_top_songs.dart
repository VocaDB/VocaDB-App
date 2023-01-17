import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_songs_list.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class TagDetailTopSongs extends StatelessWidget {
  const TagDetailTopSongs({super.key, required this.tag});

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      visible: true,
      title: 'Top songs',
      child: SongListView(
        songs: kFakeSongsList,
        onSelect: context.goSongDetail,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
