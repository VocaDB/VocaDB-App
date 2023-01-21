import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/constants/fake_release_events_list.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_events_list/release_events_section.dart';

class RecentEventsSection extends ConsumerWidget {
  const RecentEventsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReleaseEventsSection(
      releaseEvents: kFakeReleaseEventsList,
    );
  }
}
