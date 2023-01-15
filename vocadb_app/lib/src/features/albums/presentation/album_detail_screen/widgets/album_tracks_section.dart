import 'package:flutter/src/widgets/framework.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/presentation/tracks_list/tracks_list_view.dart';

class AlbumTracksSection extends StatelessWidget {
  const AlbumTracksSection({super.key, required this.album});

  final Album album;

  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      visible: album.tracks.isNotEmpty,
      title: 'Tracklist',
      child: TracksListView(tracks: album.tracks),
    );
  }
}
