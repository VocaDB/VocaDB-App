import 'package:flutter/material.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/widgets/event_tile.dart';
import 'package:vocadb/widgets/song_tile.dart';
import 'package:vocadb/widgets/album_tile.dart';
import 'package:vocadb/widgets/artist_tile.dart';

class EntryTile extends StatelessWidget {
  final EntryModel entry;

  const EntryTile(this.entry);

  @override
  Widget build(BuildContext context) {
    String tag = 'entry_${entry.entryType.toString()}_${entry.id}';

    switch (entry.entryType) {
      case EntryType.Song:
        return SongTile.fromEntry(entry, tag: tag);
      case EntryType.Album:
        return AlbumTile.fromEntry(entry, tag: tag);
      case EntryType.Artist:
        return ArtistTile.fromEntry(entry, tag: tag);
      case EntryType.ReleaseEvent:
        return EventTile.fromEntry(entry, tag: tag);

      default:
        return ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: Image.network(
              entry.mainPicture.urlThumb,
              fit: BoxFit.fill,
            ),
          ),
          title: Text(entry.name, overflow: TextOverflow.ellipsis),
        );
    }
  }
}
