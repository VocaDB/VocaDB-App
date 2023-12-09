import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

class PlaylistTrackTile extends StatelessWidget {
  const PlaylistTrackTile(
      {super.key,
      required this.song,
      required this.leading,
      this.isActive = false});

  final Song song;

  final Widget leading;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      leading: leading,
      title: Text(
        song.name ?? '<None>',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(song.artistString ?? '<None>'),
      enabled: true,
      trailing: PopupMenuButton<String>(
        onSelected: (String selectedValue) {},
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem<String>(value: 'detail', child: Text('Detail')),
        ],
      ),
      onTap: () {},
      tileColor: (isActive) ? Theme.of(context).highlightColor : null,
    );
  }
}
