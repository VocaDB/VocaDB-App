import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/common_widgets/info_section.dart';
import 'package:vocadb_app/src/common_widgets/section.dart';
import 'package:vocadb_app/src/common_widgets/text_info_section.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/albums/data/constants/fake_albums_list.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/albums_section.dart';
import 'package:vocadb_app/src/features/artists/data/constants/fake_artists_list.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artists_horizontal_list_view.dart';
import 'package:vocadb_app/src/features/songs/data/test_songs.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_section.dart';
import 'package:vocadb_app/src/features/tags/data/constants/fake_tag_detail.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_detail_screen/tag_detail_button_bar.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_chip.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';

// TODO : implement more UI detail
class TagDetailScreen extends StatelessWidget {
  const TagDetailScreen({super.key, required this.tagId});
  final String tagId;

  @override
  Widget build(BuildContext context) {
    final tag = kFakeTagDetail;

    return Scaffold(
      body: CustomScrollView(
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
              background: const SafeArea(
                child: Opacity(
                  opacity: 0.7,
                  child: Visibility(
                    visible: true,
                    child: CustomNetworkImage(
                      'https://static.vocadb.net/img/tag/mainOrig/29.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
                  TextInfoSection(
                    title: 'Name',
                    text: tag.name ?? '<None>',
                  ),
                  gapH8,
                  TextInfoSection(
                    title: 'Category',
                    text: tag.categoryName ?? '<None>',
                  ),
                  gapH8,
                  Visibility(
                    visible: tag.parent != null,
                    child: InfoSection(
                      title: 'Parent',
                      child: TagChip(
                        label: tag.parent?.name ?? '<None>',
                        onSelect: () {},
                      ),
                    ),
                  ),
                  TextInfoSection(
                    title: 'Description',
                    text: tag.description ?? '<None>',
                  ),
                  const Divider(),
                  const SongsSection(
                    title: 'Recent songs PVs',
                    songs: kFakeSongsList,
                  ),
                  const Divider(),
                  Section(
                    title: 'Top artists',
                    visible: true,
                    divider: const Divider(),
                    child: ArtistsHorizontalListView(
                      onSelect: (a) {},
                      artists: kFakeArtistList,
                    ),
                  ),
                  AlbumsSection(
                    albums: kFakeAlbumsList,
                  ),
                  const Divider(),
                  WebLinkGroupList(webLinks: tag.webLinks ?? []),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
