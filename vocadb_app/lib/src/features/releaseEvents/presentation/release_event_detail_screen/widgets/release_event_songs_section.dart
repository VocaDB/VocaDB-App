import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_repository.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class ReleaseEventSongsSection extends ConsumerWidget {
  const ReleaseEventSongsSection({super.key, required this.releaseEvent});

  final ReleaseEvent releaseEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value =
        ref.watch(releaseEventPublishedSongsProvider(releaseEvent.id));

    return AsyncValueWidget(
        value: value,
        data: (songs) {
          return Visibility(
            visible: songs.isNotEmpty,
            child: SectionDivider(
              title: 'Songs',
              visible: true,
              child: SongListView(
                scrollDirection: Axis.horizontal,
                songs: songs,
                onSelect: context.goSongDetail,
              ),
            ),
          );
        });
  }
}
