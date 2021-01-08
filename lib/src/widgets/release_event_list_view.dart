import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

class ReleaseEventListView extends StatelessWidget {
  ReleaseEventListView({Key key, this.events, this.onSelect}) : super(key: key);

  /// List of events to display.
  final List<ReleaseEventModel> events;

  final Function(ReleaseEventModel) onSelect;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.events.length,
        itemBuilder: (context, index) => ReleaseEventTile.releaseEvent(
              this.events[index],
              onTap: () => this.onSelect(this.events[index]),
            ));
  }
}
