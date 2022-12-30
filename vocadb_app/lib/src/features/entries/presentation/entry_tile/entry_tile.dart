import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_tile/album_tile.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_tile/artist_tile.dart';
import 'package:vocadb_app/src/features/entries/domain/entry.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_tile/release_event_tile.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_tile/song_tile.dart';

class EntryTile extends StatelessWidget {
  const EntryTile({super.key, required this.entry});

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    switch (EntryType.values.byName(entry.entryType)) {
      case EntryType.Song:
        return SongTile(song: entry.toSong(), onTap: () {});
      case EntryType.Artist:
        return ArtistTile(artist: entry.toArtist(), onTap: () {});
      case EntryType.Album:
        return AlbumTile(album: entry.toAlbum(), onTap: () {});
      case EntryType.ReleaseEvent:
        return ReleaseEventTile(
            releaseEvent: entry.toReleaseEvent(), onTap: () {});
      default:
        return ListTile(title: Text(entry.name));
    }
  }
}
