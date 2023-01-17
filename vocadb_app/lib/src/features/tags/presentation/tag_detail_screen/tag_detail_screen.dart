import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/common_widgets/markdown.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/tags/data/tag_repository.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_detail_screen/tag_detail_button_bar.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_detail_screen/widgets/tag_detail_image.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_detail_screen/widgets/tag_detail_top_albums.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_detail_screen/widgets/tag_detail_top_artists.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_detail_screen/widgets/tag_detail_top_songs.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';

// TODO : implement more UI detail
class TagDetailScreen extends ConsumerWidget {
  const TagDetailScreen({super.key, required this.tagId});
  final String tagId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final tag = kFakeTagDetail;
    final value = ref.watch(tagDetailProvider(int.parse(tagId)));

    return Scaffold(
      body: AsyncValueWidget(
          value: value,
          data: (tag) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 200,
                  pinned: true,
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.home),
                      onPressed: () {},
                    )
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('#${tag.name}',
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    background: SafeArea(
                      child: TagDetailImage(tag: tag),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    const TagDetailButtonBar(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: const Text('Name'),
                          subtitle: Text(tag.name ?? '<None>'),
                        ),
                        ListTile(
                          title: const Text('Category'),
                          subtitle: Text(tag.categoryName ?? '<None>'),
                        ),
                        gapH8,
                        ListTile(
                          title: const Text('Description'),
                          subtitle: Markdown(
                            data: tag.description ?? '<None>',
                          ),
                        ),
                        TagDetailTopSongs(tag: tag),
                        TagDetailTopArtists(tag: tag),
                        TagDetailTopAlbums(tag: tag),
                        const Divider(),
                        WebLinkGroupList(webLinks: tag.webLinks),
                      ],
                    )
                  ]),
                ),
              ],
            );
          }),
    );
  }
}
