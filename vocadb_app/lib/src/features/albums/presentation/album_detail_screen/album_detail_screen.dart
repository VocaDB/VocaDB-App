import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_detail_controller.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/widgets/widgets.dart';

class AlbumDetailScreen extends ConsumerWidget {
  const AlbumDetailScreen({super.key, required this.album});

  final Album album;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(albumDetailControllerProvider(album.id));
    // final value = ref.watch(albumDetailProvider(album.id));

    return Scaffold(
      body: AsyncValueWidget(
          value: controller.album,
          data: (album) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  title: Text(album.name ?? 'Album detail'),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.home),
                      onPressed: () {},
                    ),
                  ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      gapH8,
                      AlbumDetailImage(album: album),
                      gapH8,
                      AlbumBasicInfo(album: album),
                      AlbumDetailButtonBar(album: album),
                      const Divider(),
                      AlbumRatingInfo(album: album),
                      AlbumTagsSection(album: album),
                      AlbumArtistsSection(album: album),
                      gapH8,
                      AlbumTracksSection(album: album),
                      AlbumPVsSection(album: album),
                      AlbumAdditionalInfo(album: album),
                      AlbumWebLinksSection(album: album),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
