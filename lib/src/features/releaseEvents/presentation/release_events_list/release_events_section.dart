import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/section.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_events_list/release_events_horizontal_list_view.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class ReleaseEventsSection extends StatelessWidget {
  const ReleaseEventsSection(
      {super.key,
      this.title = 'Release events',
      required this.releaseEvents,
      this.onSelect});

  final String title;

  final List<ReleaseEvent> releaseEvents;

  /// Navigate to release event detail screen by default if onSelect not defined
  final Function(ReleaseEvent)? onSelect;

  @override
  Widget build(BuildContext context) {
    return Section(
      title: title,
      child: ReleaseEventsHorizontalListView(
        releaseEvents: releaseEvents,
        onSelect: (releaseEvent) {
          if (onSelect == null) {
            context.goReleaseEventDetail(releaseEvent);
          } else {
            onSelect!(releaseEvent);
          }
        },
      ),
    );
  }
}
