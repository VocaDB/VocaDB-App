import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_button_bar.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_hero_image.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_info.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_usage_group_view.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class SongDetailScreen extends StatelessWidget {
  const SongDetailScreen({super.key, required this.songId});
  final String songId;

  @override
  Widget build(BuildContext context) {
    final song = SongRepository.instance.getSongByID(songId);

    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'Song detail',
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
            TagUsageGroupView(
              tagUsages: song.tagUsages,
              onSelectTag: (tag) {
                GoRouter.of(context)
                    .pushNamed(AppRoute.tagDetail.name, params: {
                  'id': tag.id,
                });
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
