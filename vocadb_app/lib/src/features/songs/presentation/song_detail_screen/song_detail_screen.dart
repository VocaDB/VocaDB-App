import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/section.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/album_list_view.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_role_list.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';
import 'package:vocadb_app/src/features/pvs/presentation/pv_list/pv_group_list.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_button_bar.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_hero_image.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_info.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_usage_group_view.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class SongDetailScreen extends StatelessWidget {
  const SongDetailScreen({super.key, required this.songId});
  final String songId;

  @override
  Widget build(BuildContext context) {
    final song = SongRepository.instance.getSongByID(songId);

    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'Song detail',
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SongHeroImage(
                    imageUrl: song.imageUrl,
                  ),
                  const SongDetailButtonBar(),
                  SongInfo(song: song),
                  TagUsageGroupView(
                    tagUsages: song.tagUsages,
                    onSelectTag: (tag) {
                      GoRouter.of(context).pushNamed(AppRoute.tagDetail.name,
                          params: {'id': tag.id});
                    },
                  ),
                  const Divider(),
                  ArtistGroupByRoleList(
                    onTapArtist: (artist) {
                      GoRouter.of(context).pushNamed(AppRoute.artistDetail.name,
                          params: {'id': artist.id});
                    },
                    artistRoles: song.artistRoles,
                  ),
                  const Divider(),
                  PVGroupList(
                      pvs: song.pvs,
                      searchQuery: song.pvSearchQuery,
                      onTap: (pv) {}),
                  Column(
                    children: [
                      const Divider(),
                      Section(
                        title: 'Albums',
                        child: AlbumListView(
                          scrollDirection: Axis.horizontal,
                          albums: song.albums,
                          onSelect: (album) {
                            GoRouter.of(context).pushNamed(
                                AppRoute.albumDetail.name,
                                params: {'id': album.id});
                          },
                        ),
                      ),
                    ],
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
