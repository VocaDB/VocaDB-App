import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/albums_section.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_role_list.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';
import 'package:vocadb_app/src/features/pvs/presentation/pv_list/pv_group_list.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/constants/fake_release_events_list.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_events_list/release_events_section.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_songs_list.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_button_bar.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen_controller.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_hero_image.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_info.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_section.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_usage_group_view.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class SongDetailScreen extends ConsumerWidget {
  const SongDetailScreen({super.key, required this.songId});
  final String songId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state =
        ref.watch(songDetailScreenControllerProvider(int.parse(songId)));

    if (state.isLoading) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final song = state.song;

    return Scaffold(
      appBar: GlobalAppBar(
        title: Text(state.song.name!),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SongHeroImage(
                    imageUrl: song.imageUrl!,
                  ),
                  const SongDetailButtonBar(),
                  SongInfo(song: song),
                  TagUsageGroupView(
                    tagUsages: song.tags,
                    onSelectTag: (tag) {
                      GoRouter.of(context).pushNamed(AppRoute.tagDetail.name,
                          params: {'id': tag.id.toString()});
                    },
                  ),
                  const Divider(),
                  ArtistGroupByRoleList(
                    onTapArtist: (artist) {
                      GoRouter.of(context).pushNamed(AppRoute.artistDetail.name,
                          params: {'id': artist.id.toString()});
                    },
                    artistRoles: song.artists,
                  ),
                  const Divider(),
                  PVGroupList(
                      pvs: song.pvs,
                      searchQuery: song.pvSearchQuery,
                      onTap: (pv) {}),
                  const Divider(),
                  AlbumsSection(
                    albums: song.albums,
                  ),
                  const Divider(),
                  const SongsSection(
                    title: 'Alternate version',
                    songs: kFakeSongsList,
                  ),
                  const Divider(),
                  const SongsSection(
                    title: 'Users who liked this also liked',
                    songs: kFakeSongsList,
                  ),
                  const Divider(),
                  ReleaseEventsSection(
                    releaseEvents: kFakeReleaseEventsList,
                  ),
                  const Divider(),
                  WebLinkGroupList(webLinks: song.webLinks)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
