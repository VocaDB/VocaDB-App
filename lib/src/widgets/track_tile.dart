import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';

class TrackTile extends StatelessWidget {
  final int trackNumber;

  final String name;

  final String artistName;

  final GestureTapCallback onTap;

  const TrackTile(
      {Key key, this.trackNumber, this.name, this.artistName, this.onTap})
      : super(key: key);

  TrackTile.fromTrackModel(TrackModel trackModel, {this.onTap})
      : this.trackNumber = trackModel.trackNumber,
        this.name = trackModel.name,
        this.artistName = trackModel.song?.artistString;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(trackNumber.toString()),
      enabled: (this.onTap != null),
      onTap: this.onTap,
      title: Text(this.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(this.artistName ?? ' ',
          maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }
}
