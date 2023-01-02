import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/infinite_list_view.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/domain/release_event.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_tile/release_event_tile.dart';

class ReleaseEventsListView extends StatelessWidget {
  const ReleaseEventsListView({
    super.key,
    required this.events,
    this.onSelect,
    this.onReachLastItem,
    this.emptyWidget = const SizedBox(),
  });

  /// List of events to display.
  final List<ReleaseEvent> events;

  final Function(ReleaseEvent)? onSelect;

  /// A callback function when user react to last item. Only worked on list view with vertical direction.
  final VoidCallback? onReachLastItem;

  /// A widget that display when songs is empty
  final Widget emptyWidget;

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return emptyWidget;
    }

    return InfiniteListView(
      onReachLastItem: onReachLastItem,
      itemCount: events.length,
      itemBuilder: (context, index) => ReleaseEventTile(
        releaseEvent: events[index],
        onTap: () => onSelect!(events[index]),
      ),
    );
  }
}
