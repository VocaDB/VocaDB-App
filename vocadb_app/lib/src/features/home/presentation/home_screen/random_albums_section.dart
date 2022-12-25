import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/albums/data/album_repository.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/albums_section.dart';

class RandomAlbumSection extends StatelessWidget {
  const RandomAlbumSection({super.key});

  @override
  Widget build(BuildContext context) {
    final albums = AlbumsRepository.instance.getRandomAlbums();

    return AlbumsSection(
      title: 'Random popular albums',
      albums: albums,
    );
  }
}
