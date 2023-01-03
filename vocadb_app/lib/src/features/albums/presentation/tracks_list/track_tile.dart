import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/albums/domain/track.dart';

class TrackTile extends StatelessWidget {
  final Track track;

  final GestureTapCallback? onTap;

  const TrackTile({
    super.key,
    required this.track,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(track.trackNumber.toString()),
      enabled: (onTap != null),
      onTap: onTap,
      title: Text(track.trackName ?? '<None>',
          maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(track.trackArtistString ?? '<None>',
          maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }
}
