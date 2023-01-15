import 'package:flutter/material.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_usage_group_view.dart';

class ArtistTagSection extends StatelessWidget {
  const ArtistTagSection({super.key, required this.artist});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    if (artist.tags.isEmpty) {
      return Container();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH8,
        TagUsageGroupView(
          tagUsages: artist.tags,
        ),
        gapH8,
      ],
    );
  }
}
