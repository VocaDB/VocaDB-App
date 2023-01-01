import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/albums/data/constants/fake_album_detail.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_additional_info.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_detail_button_bar.dart';
import 'package:vocadb_app/src/features/albums/presentation/tracks_list/tracks_list_view.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_usage_group_view.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';

// TODO : need implementation
class AlbumDetailScreen extends StatelessWidget {
  const AlbumDetailScreen({super.key, required this.albumId});
  final String albumId;

  @override
  Widget build(BuildContext context) {
    final album = kFakeAlbumDetailSingleDisc;

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
                Column(
                  children: [
                    Visibility(
                      visible:
                          album.ratingCount != null && album.ratingCount! > 0,
                      child: Text(
                          '${album.ratingAverage} ★ (${album.ratingCount})'),
                    ),
                    gapH8,
                    Text(
                      album.name!,
                      style: Theme.of(context).textTheme.headline6,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    gapH8,
                    Text(album.artistString!),
                    gapH4,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${album.discType} • ${album.releaseDate!.formatted}',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    )
                  ],
                ),
                gapH8,
                const AlbumDetailButtonBar(),
                TagUsageGroupView(
                  tagUsages: album.tags!,
                ),
                AlbumAdditionalInfo(
                  album: album,
                ),
                const Divider(),
                TracksListView(tracks: album.tracks ?? []),
                const Divider(),
                WebLinkGroupList(webLinks: album.webLinks!)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
