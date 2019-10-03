import 'package:flutter/material.dart';
import 'package:vocadb/models/track_model.dart';
import 'package:vocadb/pages/song_detail/song_detail_page.dart';

class AlbumTrack extends StatelessWidget {
  final TrackModel track;

  const AlbumTrack(this.track, {Key key}) : super(key: key);

  void navigateToSongDetail(BuildContext context) {
    Navigator.pushNamed(context, SongDetailScreen.routeName,
        arguments: SongDetailScreenArguments(track.id, track.name));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(track.trackNumber.toString()),
      enabled: (track.song != null),
      onTap: () => navigateToSongDetail(context),
      title: Text(track.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(track.song?.artistString ?? ' ',
          maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }
}
