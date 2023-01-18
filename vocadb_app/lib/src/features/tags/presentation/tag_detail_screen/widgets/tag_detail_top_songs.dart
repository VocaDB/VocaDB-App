import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_detail_screen/tag_detail_providers.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class TagDetailTopSongs extends ConsumerWidget {
  const TagDetailTopSongs({super.key, required this.tag});

  final Tag tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(topSongsByTagIdProvider(tag.id));

    return SectionDivider(
      visible: true,
      title: 'Top songs',
      child: AsyncValueWidget(
          value: value,
          data: (data) {
            return SongListView(
              songs: data,
              onSelect: context.goSongDetail,
              scrollDirection: Axis.horizontal,
            );
          }),
    );
  }
}
