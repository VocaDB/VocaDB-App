import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/albums_section.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen.dart';

class SongDetailAlbumsSection extends StatelessWidget {
  const SongDetailAlbumsSection(
      {super.key, required this.song, this.onTapAlbum});

  final Song song;

  final Function(Album album)? onTapAlbum;

  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      visible: song.albums.isNotEmpty,
      child: AlbumsSection(
        key: SongDetailScreen.albumsKey,
        albums: song.albums,
        onSelect: onTapAlbum,
      ),
    );
  }
}
