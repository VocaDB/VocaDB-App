import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/error_message_widget.dart';
import 'package:vocadb_app/src/common_widgets/section.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/song_placeholder_list_view.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';

class HighlightedSection extends StatelessWidget {
  const HighlightedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'highlighted',
      child: Consumer(
        builder: ((context, ref, child) {
          final value = ref.watch(songsHighlightedProvider);
          return value.when(
            data: (data) => SongListView(
              scrollDirection: Axis.horizontal,
              songs: data,
              onSelect: (song) {},
            ),
            error: (e, st) => Center(
              child: ErrorMessageWidget(e.toString()),
            ),
            loading: () => const SongPlaceholderListView(),
          );
        }),
      ),
    );
  }
}
