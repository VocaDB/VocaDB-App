import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_card/release_event_card.dart';

class ReleaseEventsHorizontalListView extends StatelessWidget {
  const ReleaseEventsHorizontalListView({
    super.key,
    required this.releaseEvents,
    this.onSelect,
    this.emptyWidget = const SizedBox(),
  });

  /// List of events to display.
  final List<ReleaseEvent> releaseEvents;

  final Function(ReleaseEvent)? onSelect;

  /// A widget that display when events is empty
  final Widget emptyWidget;

  /// Height of list content widget if set as horizontal.
  static const double _rowHeight = 180;

  @override
  Widget build(BuildContext context) {
    if (releaseEvents.isEmpty) {
      return emptyWidget;
    }

    return SizedBox(
      height: _rowHeight,
      child: ListView.builder(
        itemCount: releaseEvents.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ReleaseEventCard(
                releaseEvent: releaseEvents[index],
                onTap: () {
                  onSelect!(releaseEvents[index]);
                },
              ),
            )),
      ),
    );
  }
}
