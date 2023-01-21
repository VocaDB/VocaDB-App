import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/common_widgets/info_section.dart';
import 'package:vocadb_app/src/common_widgets/section.dart';
import 'package:vocadb_app/src/common_widgets/text_info_section.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/albums/data/constants/fake_albums_list.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/albums_section.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_role_list.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/constants/fake_release_event_detail.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_detail_screen/release_event_detail_button_bar.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_tile/release_event_series_tile.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_songs_list.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_section.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_usage_group_view.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';

// TODO : need implementation
class ReleaseEventDetailScreen extends StatelessWidget {
  const ReleaseEventDetailScreen({super.key, required this.releaseEventId});
  final String releaseEventId;

  @override
  Widget build(BuildContext context) {
    final releaseEvent = kFakeReleaseEventDetail;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 500,
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
              title: Text(
                releaseEvent.name ?? '<None>',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              background: SafeArea(
                child: Opacity(
                  opacity: 0.7,
                  child: Visibility(
                    visible: true,
                    child: CustomNetworkImage(
                      releaseEvent.imageUrl!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const ReleaseEventDetailButtonBar(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gapH8,
                  TagUsageGroupView(
                    tagUsages: releaseEvent.tags ?? [],
                  ),
                  gapH8,
                  TextInfoSection(
                    title: 'Name',
                    text: releaseEvent.name ?? '<None>',
                  ),
                  gapH8,
                  TextInfoSection(
                    title: 'Category',
                    text: releaseEvent.category ?? '<None>',
                  ),
                  gapH8,
                  TextInfoSection(
                    title: 'Date',
                    text: releaseEvent.dateFormatted ?? '<None>',
                  ),
                  gapH8,
                  TextInfoSection(
                    title: 'Venune',
                    text: releaseEvent.venueName ?? '<None>',
                  ),
                  gapH8,
                  InfoSection(
                    title: 'Description',
                    visible: true,
                    child: MarkdownBody(
                      data: releaseEvent.description ?? '<None>',
                      selectable: true,
                    ),
                  ),
                  const Divider(),
                  Section(
                    title: 'Participating artists',
                    visible: releaseEvent.artists != null &&
                        releaseEvent.artists!.isNotEmpty,
                    divider: const Divider(),
                    child: ArtistGroupByRoleList(
                      artistRoles: releaseEvent.artists ?? [],
                      onTapArtist: (a) {},
                      displayRole: false,
                    ),
                  ),
                  const Divider(),
                  const SongsSection(
                    songs: kFakeSongsList,
                  ),
                  const Divider(),
                  AlbumsSection(
                    albums: kFakeAlbumsList,
                  ),
                  Section(
                    title: 'Series',
                    visible: releaseEvent.series != null,
                    child: ReleaseEventSeriesTile(
                      series: releaseEvent.series!,
                      onTap: () {},
                    ),
                  ),
                  const Divider(),
                  WebLinkGroupList(webLinks: releaseEvent.webLinks ?? []),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
