import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/domain/release_event_series.dart';

/// A widget for display release event series tile
class ReleaseEventSeriesTile extends StatelessWidget {
  final ReleaseEventSeries series;

  final GestureTapCallback? onTap;

  const ReleaseEventSeriesTile({super.key, required this.series, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: const Icon(Icons.calendar_today),
        title: Text(series.name ?? '<None>'));
  }
}
