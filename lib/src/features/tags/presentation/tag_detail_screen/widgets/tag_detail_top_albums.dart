import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/albums/data/constants/fake_albums_list.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/album_list_view.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_detail_screen/tag_detail_providers.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class TagDetailTopAlbums extends ConsumerWidget {
  const TagDetailTopAlbums({super.key, required this.tag});

  final Tag tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(topAlbumsByTagIdProvider(tag.id));

    return AsyncValueWidget(
        value: value,
        data: (data) {
          return SectionDivider(
            visible: true,
            title: 'Top albums',
            child: AlbumListView(
              onSelect: context.goAlbumDetail,
              albums: kFakeAlbumsList,
              scrollDirection: Axis.horizontal,
            ),
          );
        });
  }
}
