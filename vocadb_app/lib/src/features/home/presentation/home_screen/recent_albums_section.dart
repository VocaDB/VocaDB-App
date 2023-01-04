import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/error_message_widget.dart';
import 'package:vocadb_app/src/common_widgets/section.dart';
import 'package:vocadb_app/src/features/albums/data/album_repository.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/album_list_view.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/album_placeholder_list_view.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class RecentAlbumSection extends StatelessWidget {
  const RecentAlbumSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Recent or upcoming albums',
      child: Consumer(
        builder: ((context, ref, child) {
          final value = ref.watch(albumsNewProvider);
          return value.when(
            data: (data) => AlbumListView(
              scrollDirection: Axis.horizontal,
              albums: data,
              onSelect: (album) {
                GoRouter.of(context).pushNamed(
                  AppRoute.albumDetail.name,
                  params: {'id': album.id.toString()},
                );
              },
            ),
            error: (e, st) => Center(
              child: ErrorMessageWidget(e.toString()),
            ),
            loading: () => const AlbumPlaceholderListView(),
          );
        }),
      ),
    );
  }
}
