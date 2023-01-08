import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/error_message_widget.dart';
import 'package:vocadb_app/src/common_widgets/section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen_controller.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';

class SongsDerivedListView extends ConsumerWidget {
  const SongsDerivedListView({super.key, required this.songId});

  final int songId;

  static const altSongsKey = Key('alt-songs-key');
  static const altSongsErrorKey = Key('alt-songs-error-key');
  static const altSongsLoadingKey = Key('alt-songs-loading-key');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(songDerivedStateProvider(songId));
    return value.when(
      data: (data) {
        if (data.isEmpty) {
          return Container();
        }

        return Column(
          children: [
            const Divider(),
            Section(
              title: 'Alternate version',
              key: altSongsKey,
              child: SongListView(
                scrollDirection: Axis.horizontal,
                songs: data,
                onSelect: (song) {},
              ),
            ),
          ],
        );
      },
      error: (e, st) {
        return Center(
            key: altSongsErrorKey, child: ErrorMessageWidget(e.toString()));
      },
      loading: () {
        return const Center(
            key: altSongsLoadingKey, child: CircularProgressIndicator());
      },
    );
  }
}
