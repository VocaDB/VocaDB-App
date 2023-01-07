import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/albums_section.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_role_list.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';
import 'package:vocadb_app/src/features/pvs/presentation/pv_list/pv_group_list.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_button_bar.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen_controller.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_hero_image.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_info.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_derived_list_view.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_related_list_view.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_usage_group_view.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class SongDetailScreen extends ConsumerStatefulWidget {
  const SongDetailScreen({super.key, required this.songId});
  final String songId;

  /// Keys for test
  static const tagsKey = Key('tags-key');
  static const artistsKey = Key('artists-key');
  static const pvsKey = Key('pvs-key');
  static const albumsKey = Key('albums-key');
  static const releaseEventsKey = Key('release-event-key');
  static const webLinksKey = Key('web-links-key');
  static const songDetailScrollKey = Key('song-detail-scroll-key');

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SongDetailScreenState();
}

class _SongDetailScreenState extends ConsumerState<SongDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final state =
        ref.watch(songDetailScreenControllerProvider(int.parse(widget.songId)));
    return AsyncValueWidget(
      value: state.song,
      data: (song) => SongDetailContent(song: song),
    );
  }
}

class SongDetailContent extends StatelessWidget {
  const SongDetailContent({super.key, required this.song});

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: Text(song.name ?? 'Song detail'),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                key: SongDetailScreen.songDetailScrollKey,
                children: [
                  // const Text('asdasd', key: SongsDerivedListView.altSongsKey),

                  SongHeroImage(
                    imageUrl: song.imageUrl!,
                  ),
                  const SongDetailButtonBar(),
                  SongInfo(song: song),
                  Visibility(
                    visible: song.tags.isNotEmpty,
                    child: TagUsageGroupView(
                      key: SongDetailScreen.tagsKey,
                      tagUsages: song.tags,
                      onSelectTag: (tag) {
                        GoRouter.of(context).pushNamed(AppRoute.tagDetail.name,
                            params: {'id': tag.id.toString()});
                      },
                    ),
                  ),
                  SectionDivider(
                    visible: song.artists.isNotEmpty,
                    child: ArtistGroupByRoleList(
                      key: SongDetailScreen.artistsKey,
                      onTapArtist: (artist) {
                        GoRouter.of(context).pushNamed(
                            AppRoute.artistDetail.name,
                            params: {'id': artist.id.toString()});
                      },
                      artistRoles: song.artists,
                    ),
                  ),
                  SectionDivider(
                    visible: song.pvs.isNotEmpty,
                    child: PVGroupList(
                      key: SongDetailScreen.pvsKey,
                      pvs: song.pvs,
                      searchQuery: song.pvSearchQuery,
                      onTap: (pv) {},
                    ),
                  ),
                  SectionDivider(
                    visible: song.albums.isNotEmpty,
                    child: AlbumsSection(
                      key: SongDetailScreen.albumsKey,
                      albums: song.albums,
                    ),
                  ),
                  SongsDerivedListView(
                    songId: song.id,
                  ),
                  SongsRelatedListView(
                    songId: song.id,
                  ),
                  SectionDivider(
                    visible: song.webLinks.isNotEmpty,
                    child: WebLinkGroupList(
                      key: SongDetailScreen.webLinksKey,
                      webLinks: song.webLinks,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
