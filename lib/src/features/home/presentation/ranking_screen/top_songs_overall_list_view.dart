import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/song_placeholder_list_view.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';

class TopSongsOverallListView extends ConsumerWidget {
  const TopSongsOverallListView({super.key, this.onSelect});

  final Function(Song)? onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(songsOverallProvider);
    return AsyncValueWidget(
      value: value,
      loadingWidget: const SongPlaceholderListView(scrollDirection: Axis.vertical,),
      data: (data) => SongListView(
        songs: data,
        displayOrderNumber: true,
        onSelect: (song) => onSelect?.call(song),
      ),
    );
  }
}
