import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/error_message_widget.dart';
import 'package:vocadb_app/src/common_widgets/section.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/album_list_view.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/album_placeholder_list_view.dart';
import 'package:vocadb_app/src/features/home/presentation/main_screen/main_screen_controller.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class RandomAlbumSection extends StatelessWidget {
  const RandomAlbumSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Random popular albums',
      child: Consumer(
        builder: ((context, ref, child) {
          final value = ref.watch(mainScreenTopAlbumsProvider);
          if (value == null) {
            return const AlbumPlaceholderListView();
          }
          return value.when(
            data: (data) => AlbumListView(
              scrollDirection: Axis.horizontal,
              albums: data,
              onSelect: context.goAlbumDetail,
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