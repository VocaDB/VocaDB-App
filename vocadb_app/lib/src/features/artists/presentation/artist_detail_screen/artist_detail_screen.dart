import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/artists/data/constants/fake_artist_detail.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/artist_additional_info.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/artist_basic_info.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/artist_detail_button_bar.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/artist_relations_view.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_usage_group_view.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/web_link_group_view.dart';

// TODO : need implementation
class ArtistDetailScreen extends StatelessWidget {
  const ArtistDetailScreen({super.key, required this.artistId});

  final String artistId;

  @override
  Widget build(BuildContext context) {
    final artist = kFakeArtistDetail;

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
              title: const Text('Artist name'),
              background: SafeArea(
                child: Opacity(
                  opacity: 0.7,
                  child: CustomNetworkImage(
                    artist.imageUrl!,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const ArtistDetailButtonBar(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ArtistBasicInfo(artist: artist),
                    gapH8,
                    TagUsageGroupView(
                      tagUsages: artist.tags!,
                    ),
                    gapH8,
                    ArtistAdditionalInfo(
                      artist: artist,
                    ),
                  ],
                ),
                const Divider(),
                ArtistRelationsView(
                  artistRelations: artist.relations!,
                ),
                WebLinkGroupList(webLinks: artist.webLinks!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
