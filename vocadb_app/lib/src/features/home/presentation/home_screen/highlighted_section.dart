import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/section.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class HighlightedSection extends StatelessWidget {
  const HighlightedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final songs = SongRepository.instance.getHighlightedSongsList();

    return Section(
      title: 'Highlighted',
      child: SongListView(
        songs: songs,
        scrollDirection: Axis.horizontal,
        onSelect: (song) => {
          GoRouter.of(context)
              .pushNamed(AppRoute.songDetail.name, params: {'id': song.id})
        },
      ),
    );
  }
}
