import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/albums/data/constants/fake_album_detail.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_additional_info.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_detail_button_bar.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_rating_info.dart';
import 'package:vocadb_app/src/features/albums/presentation/tracks_list/tracks_list_view.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_roles_horizontal_list_view.dart';
import 'package:vocadb_app/src/features/pvs/presentation/pv_list/pv_group_list.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_usage_group_view.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';

// TODO : need implementation
class AlbumDetailScreen extends StatelessWidget {
  const AlbumDetailScreen({super.key, required this.albumId});
  final String albumId;

  @override
  Widget build(BuildContext context) {
    final album = kFakeAlbumDetailSingleDisc;
    final artistRoles = album.artists;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: Text(album.name!),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                gapH8,
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CustomNetworkImage(
                    album.imageUrl!,
                    fit: BoxFit.contain,
                  ),
                ),
                gapH8,
                AlbumRatingInfo(album: album),
                const AlbumDetailButtonBar(),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          album.ratingCount.toString() ?? '0',
                        ),
                        gapH4,
                        Text(
                          'Total Ratings',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('★ ${album.ratingAverage} / 5'),
                        gapH4,
                        Text(
                          'Average Rating',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                TagUsageGroupView(
                  tagUsages: album.tags ?? [],
                ),
                const Divider(),
                ListTile(
                  title: Text('Artists',
                      style: Theme.of(context).textTheme.headline6!),
                ),
                ArtistRolesHorizontalListView(
                  artists: artistRoles ?? [],
                ),
                gapH8,
                const Divider(),
                ListTile(
                  title: Text('Tracklist',
                      style: Theme.of(context).textTheme.headline6!),
                ),
                TracksListView(tracks: album.tracks ?? []),
                const Divider(),
                PVGroupList(pvs: album.pvs ?? [], searchQuery: ''),
                const Divider(),
                AlbumAdditionalInfo(album: album),
                ListTile(
                  title: const Text('Related albums'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
                const Divider(),
                WebLinkGroupList(webLinks: album.webLinks ?? []),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
