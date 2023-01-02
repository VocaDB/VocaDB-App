import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/pvs/presentation/playlist_screen/playlist_track_tile.dart';
import 'package:vocadb_app/src/features/songs/data/test_songs.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key, required this.songs});

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlist'),
      ),
      body: ListView.builder(
        itemCount: kFakeSongsList.length,
        itemBuilder: ((context, index) {
          final song = songs[index];
          return PlaylistTrackTile(
            leading: Text('${index + 1}'),
            song: song,
          );
        }),
      ),
    );
  }
}
