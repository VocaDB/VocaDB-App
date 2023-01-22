import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/album_list_view.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_repository.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class ReleaseEventAlbumsSection extends ConsumerWidget {
  const ReleaseEventAlbumsSection({super.key, required this.releaseEvent});

  final ReleaseEvent releaseEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(releaseEventAlbumsProvider(releaseEvent.id));

    return AsyncValueWidget(
        value: value,
        data: (albums) {
          return Visibility(
            visible: albums.isNotEmpty,
            child: SectionDivider(
              title: 'Albums',
              visible: true,
              child: AlbumListView(
                scrollDirection: Axis.horizontal,
                albums: albums,
                onSelect: context.goAlbumDetail,
              ),
            ),
          );
        });
  }
}
