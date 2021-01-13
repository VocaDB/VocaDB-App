import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

class ReleaseEventListView extends StatelessWidget {
  ReleaseEventListView(
      {Key key,
      this.events,
      this.onSelect,
      this.onReachLastItem,
      this.emptyWidget})
      : super(key: key);

  /// List of events to display.
  final List<ReleaseEventModel> events;

  final Function(ReleaseEventModel) onSelect;

  /// A callback function when user react to last item. Only worked on list view with vertical direction.
  final Function onReachLastItem;

  /// A widget that display when songs is empty
  final Widget emptyWidget;

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty && this.emptyWidget != null) {
      return this.emptyWidget;
    }

    return InfiniteListView(
        onReachLastItem: this.onReachLastItem,
        itemCount: this.events.length,
        itemBuilder: (context, index) => ReleaseEventTile.releaseEvent(
              this.events[index],
              onTap: () => this.onSelect(this.events[index]),
            ));
  }
}
