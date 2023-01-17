import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/artists/data/constants/fake_artists_list.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artists_horizontal_list_view.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class TagDetailTopArtists extends StatelessWidget {
  const TagDetailTopArtists({super.key, required this.tag});

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      visible: true,
      title: 'Top artists',
      child: ArtistsHorizontalListView(
        onSelect: (a) {
          if (a != null) context.goArtistDetail(a);
        },
        artists: kFakeArtistList,
      ),
    );
  }
}
