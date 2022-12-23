import 'package:flutter/material.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/songs/data/songs_repository.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_button_bar.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_hero_image.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_info.dart';

class SongDetailScreen extends StatelessWidget {
  const SongDetailScreen({super.key, required this.songId});
  final String songId;

  @override
  Widget build(BuildContext context) {
    final song = SongRepository.instance.getSongByID(songId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Song Detail ID'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => {},
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => {},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: Sizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SongHeroImage(
              imageUrl: song.imageUrl,
            ),
            const SongDetailButtonBar(),
            SongInfo(song: song),
          ],
        ),
      ),
    );
  }
}
