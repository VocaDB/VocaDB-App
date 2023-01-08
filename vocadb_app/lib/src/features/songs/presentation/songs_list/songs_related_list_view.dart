import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/error_message_widget.dart';
import 'package:vocadb_app/src/common_widgets/section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen_controller.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';

class SongsRelatedListView extends ConsumerWidget {
  const SongsRelatedListView({super.key, required this.songId});

  final int songId;

  static const sameLikedSongsKey = Key('same-liked-songs-key');
  static const sameLikedSongsErrorKey = Key('same-liked-songs-error-key');
  static const sameLikedSongsLoadingKey = Key('same-liked-songs-loading-key');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(songRelatedStateProvider(songId));
    return value.when(
      data: (data) {
        if (data.likeMatches.isEmpty) {
          return Container();
        }

        return Column(
          children: [
            const Divider(),
            Section(
              title: 'Users who liked this also liked',
              key: sameLikedSongsKey,
              child: SongListView(
                scrollDirection: Axis.horizontal,
                songs: data.likeMatches,
                onSelect: (song) {},
              ),
            ),
          ],
        );
      },
      error: (e, st) {
        return Center(
            key: sameLikedSongsErrorKey,
            child: ErrorMessageWidget(e.toString()));
      },
      loading: () {
        return const Center(
            key: sameLikedSongsLoadingKey, child: CircularProgressIndicator());
      },
    );
  }
}
