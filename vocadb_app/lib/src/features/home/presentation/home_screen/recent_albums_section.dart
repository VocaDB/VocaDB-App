import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/albums/data/album_repository.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/albums_section.dart';

class RecentAlbumSection extends StatelessWidget {
  const RecentAlbumSection({super.key});

  @override
  Widget build(BuildContext context) {
    final albums = AlbumsRepository.instance.getNewAlbums();

    return AlbumsSection(
      title: 'Recent or upcoming albums',
      albums: albums,
    );
  }
}
