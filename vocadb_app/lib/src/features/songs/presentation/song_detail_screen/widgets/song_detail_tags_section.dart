import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_usage_group_view.dart';

class SongDetailTagsSection extends StatelessWidget {
  const SongDetailTagsSection(
      {super.key, required this.song, this.onSelectTag});

  final Song song;

  final Function(Tag tag)? onSelectTag;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: song.tags.isNotEmpty,
      child: TagUsageGroupView(
        key: SongDetailScreen.tagsKey,
        tagUsages: song.tags,
        onSelectTag: onSelectTag,
      ),
    );
  }
}
