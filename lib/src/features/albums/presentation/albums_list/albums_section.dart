import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/section.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/album_list_view.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

/// A widget for display section of albums as horizontal
class AlbumsSection extends StatelessWidget {
  const AlbumsSection(
      {super.key, this.title = 'Albums', required this.albums, this.onSelect});

  final String title;

  final List<Album> albums;

  /// Navigate to album detail screen by default if onSelect not defined
  final Function(Album)? onSelect;

  @override
  Widget build(BuildContext context) {
    return Section(
      title: title,
      child: AlbumListView(
        scrollDirection: Axis.horizontal,
        albums: albums,
        onSelect: (album) {
          if (onSelect == null) {
            context.goAlbumDetail(album);
          } else {
            onSelect!(album);
          }
        },
      ),
    );
  }
}
