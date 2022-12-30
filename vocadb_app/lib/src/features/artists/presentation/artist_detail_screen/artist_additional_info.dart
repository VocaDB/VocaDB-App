import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/expandable_content.dart';
import 'package:vocadb_app/src/common_widgets/text_info_section.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_link_list_view.dart';

class ArtistAdditionalInfo extends StatelessWidget {
  const ArtistAdditionalInfo({super.key, required this.artist});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: ExpandableContent(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: artist.releaseDate != null,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextInfoSection(
                  title: 'Release date',
                  text: artist.releaseDateFormatted!,
                ),
              ),
            ),
            gapH8,
            Visibility(
              visible: artist.description != null,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextInfoSection(
                  title: 'Description',
                  text: artist.description!,
                ),
              ),
            ),
            gapH8,
            Visibility(
              visible: true,
              child: ArtistLinkListView(
                artistLinks: artist.artistLinks ?? [],
                onSelect: (artistLinkModel) {},
              ),
            ),
            Visibility(
              visible: artist.artistLinksReverse != null &&
                  artist.artistLinksReverse!.isNotEmpty,
              child: ArtistLinkListView(
                reverse: true,
                artistLinks: artist.artistLinksReverse ?? [],
                onSelect: (artistLinkModel) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
