import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_section.dart';

class HighlightedSection extends StatelessWidget {
  const HighlightedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final songs = SongRepository.instance.getHighlightedSongsList();

    return SongsSection(
      title: 'Highlighted',
      songs: songs,
    );
  }
}
