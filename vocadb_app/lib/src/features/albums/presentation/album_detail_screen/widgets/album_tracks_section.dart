import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/domain/track.dart';
import 'package:vocadb_app/src/features/albums/presentation/tracks_list/tracks_list_view.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class AlbumTracksSection extends StatelessWidget {
  const AlbumTracksSection({super.key, required this.album, this.onSelect});

  final Album album;

  final Function(Track)? onSelect;

  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      visible: album.tracks.isNotEmpty,
      title: 'Tracklist',
      child: TracksListView(
        tracks: album.tracks,
        onSelect: (track) {
          if (track.song != null) {
            context.goSong(track.song!.id);
          }
        },
      ),
    );
  }
}
