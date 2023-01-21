import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_tile/release_event_tile.dart';

/// A widget for generate release events in [Column] instead of [ListView]. Use it only when need to display release event content inside parent [ListView] widget.
class ReleaseEventsColumnView extends StatelessWidget {
  const ReleaseEventsColumnView(
      {super.key, required this.events, this.onSelect});

  /// List of events to display.
  final List<ReleaseEvent> events;

  /// The callback function that called when user tap any item.
  final Function(ReleaseEvent)? onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: events
          .map((e) => ReleaseEventTile(
                releaseEvent: e,
                onTap: () => onSelect!(e),
              ))
          .toList(),
    );
  }
}
