import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_usage_group_view.dart';

class AlbumTagsSection extends StatelessWidget {
  const AlbumTagsSection({super.key, required this.album, this.onSelectTag});

  final Album album;

  final Function(Tag tag)? onSelectTag;

  @override
  Widget build(BuildContext context) {
    return SectionDivider(
      visible: album.tags.isNotEmpty,
      child: TagUsageGroupView(
        tagUsages: album.tags,
        onSelectTag: onSelectTag,
      ),
    );
  }
}
