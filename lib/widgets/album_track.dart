import 'package:flutter/material.dart';
import 'package:vocadb/models/track.dart';

class AlbumTrack extends StatelessWidget {
  final Track track;

  const AlbumTrack(this.track, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(track.trackNumber.toString()),
      title: Text(track.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(track.song.artistString,
          maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }
}
