import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/section.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

/// A widget for display section of songs as horizontal
class SongsSection extends StatelessWidget {
  const SongsSection(
      {super.key, this.title = 'Songs', required this.songs, this.onSelect});

  final String title;

  final List<Song> songs;

  /// Navigate to song detail screen by default if onSelect not defined
  final Function(Song)? onSelect;

  @override
  Widget build(BuildContext context) {
    return Section(
      title: title,
      child: SongListView(
        scrollDirection: Axis.horizontal,
        songs: songs,
        onSelect: (song) {
          if (onSelect == null) {
            GoRouter.of(context).pushNamed(AppRoute.songDetail.name,
                params: {'id': song.id.toString()});
          } else {
            onSelect!(song);
          }
        },
      ),
    );
  }
}
