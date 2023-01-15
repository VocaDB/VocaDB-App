import 'package:flutter/material.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/artists/data/constants/fake_artist_detail.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/widgets/artist_additional_info.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/widgets/artist_detail_button_bar.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/widgets/artist_relations_view.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/widgets/artist_detail_desc.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/widgets/artist_detail_image.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/widgets/artist_tags_section.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/widgets/artist_web_links_section.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_link_list_view.dart';

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
                child: ArtistDetailImage(artist: artist),
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
                ArtistDetailDesc(artist: artist),
                const Divider(),
                ArtistDetailButtonBar(artist: artist),
                ArtistTagSection(artist: artist),
                ArtistRelationsView(artistRelations: artist.relations),
                ArtistAdditionalInfo(artist: artist),
                ArtistLinkListView(artistLinks: artist.artistLinks),
                ArtistWebLinksSection(artist: artist),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
