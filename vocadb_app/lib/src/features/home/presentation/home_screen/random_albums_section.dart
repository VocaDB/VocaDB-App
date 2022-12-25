import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/section.dart';
import 'package:vocadb_app/src/features/albums/data/album_repository.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/album_list_view.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class RandomAlbumSection extends StatelessWidget {
  const RandomAlbumSection({super.key});

  @override
  Widget build(BuildContext context) {
    final albums = AlbumsRepository.instance.getRandomAlbums();

    return Section(
      title: 'Random popular albums',
      child: AlbumListView(
        albums: albums,
        scrollDirection: Axis.horizontal,
        onSelect: (album) => {
          GoRouter.of(context)
              .pushNamed(AppRoute.albumDetail.name, params: {'id': album.id})
        },
      ),
    );
  }
}
