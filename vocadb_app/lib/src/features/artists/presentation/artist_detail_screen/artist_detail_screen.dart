import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/artists/data/constants/fake_artist_detail.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/artist_additional_info.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/artist_detail_button_bar.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/artist_relations_view.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_link_list_view.dart';
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
            expandedHeight: 300,
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
              centerTitle: true,
              title: Text(artist.name ?? '<None>'),
              background: SafeArea(
                child: Container(
                  color: Theme.of(context).canvasColor,
                  child: Center(
                    child: ClipOval(
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(8.0),
                        child: CustomNetworkImage(
                          artist.imageUrl!,
                          width: 130,
                          height: 130,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                gapH8,
                Center(
                    child: Text(
                  artist.artistType ?? '<None>',
                  style: Theme.of(context).textTheme.titleLarge,
                )),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: ((context) {
                        return Padding(
                          padding: const EdgeInsets.all(Sizes.p16),
                          child: ListView(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    padding: const EdgeInsets.all(0),
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                              gapH12,
                              Text(
                                artist.name!,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              gapH16,
                              Text(artist.description!),
                            ],
                          ),
                        );
                      }),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      artist.description!,
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
                const Divider(),
                const ArtistDetailButtonBar(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapH8,
                    TagUsageGroupView(
                      tagUsages: artist.tags!,
                    ),
                    gapH8,
                  ],
                ),
                const Divider(),
                ArtistRelationsView(
                  artistRelations: artist.relations!,
                ),
                ArtistAdditionalInfo(
                  artist: artist,
                ),
                ArtistLinkListView(artistLinks: artist.artistLinks ?? []),
                const Divider(),
                WebLinkGroupList(webLinks: artist.webLinks!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
