import 'package:flutter/material.dart';

/// A widget for display release event series tile
class ReleaseEventSeriesTile extends StatelessWidget {
  final String name;

  final GestureTapCallback onTap;

  const ReleaseEventSeriesTile({this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    if (this.name == null || this.name.isEmpty) return Container();

    return ListTile(
        onTap: this.onTap,
        leading: Icon(Icons.calendar_today),
        title: Text(this.name));
  }
}
