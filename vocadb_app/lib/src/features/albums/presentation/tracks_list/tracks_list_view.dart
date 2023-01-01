import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/albums/domain/track.dart';
import 'package:vocadb_app/src/features/albums/presentation/tracks_list/track_tile.dart';

/// A widget display list of tracks
class TracksListView extends StatelessWidget {
  final List<Track> tracks;

  final Function(Track?)? onSelect;

  const TracksListView({super.key, required this.tracks, this.onSelect});

  Widget _mapTrackModel(Track t) {
    return TrackTile(
      track: t,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    Map<String, List<Track>> tracksByDisc = tracks.groupByDisc;

    if (tracksByDisc.length > 1) {
      tracksByDisc.forEach((key, value) {
        widgets.add(ListTile(
          title: Text('Disc ' ' $key'),
        ));

        widgets.addAll(value.map<Widget>(_mapTrackModel).toList());
      });
    } else {
      widgets.addAll(tracks.map<Widget>(_mapTrackModel).toList());
    }

    return Container(
      child: Column(
        children: widgets,
      ),
    );
  }
}
