import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

class ReleaseEventListView extends StatelessWidget {
  ReleaseEventListView({Key key, this.events}) : super(key: key);

  /// List of events to display.
  final List<ReleaseEventModel> events;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.events.length,
        itemBuilder: (context, index) =>
            ReleaseEventTile.fromEntry(this.events[index]));
  }
}
