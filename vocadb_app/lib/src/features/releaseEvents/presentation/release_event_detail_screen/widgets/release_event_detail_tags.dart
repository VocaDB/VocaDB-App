import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_usage_group_view.dart';

class ReleaseEventDetailTags extends StatelessWidget {
  const ReleaseEventDetailTags({super.key, required this.releaseEvent});

  final ReleaseEvent releaseEvent;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: releaseEvent.tags != null || releaseEvent.tags!.isNotEmpty,
      child: TagUsageGroupView(
        tagUsages: releaseEvent.tags ?? [],
      ),
    );
  }
}
