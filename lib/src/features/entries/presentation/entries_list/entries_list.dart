import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/entries/domain/entry.dart';
import 'package:vocadb_app/src/features/entries/presentation/entry_tile/entry_tile.dart';

// TODO : implement more UI detail
class EntriesList extends StatelessWidget {
  const EntriesList({super.key, required this.entries});

  final List<Entry> entries;

  @override
  Widget build(BuildContext context) {
    final songs = entries.songEntries;
    final artists = entries.artistEntries;
    final albums = entries.albumEntries;
    final releaseEvents = entries.releaseEventEntries;

    final filterdEntries = [
      ...songs,
      ...artists,
      ...albums,
      ...releaseEvents,
    ];

    return ListView.builder(
        itemCount: filterdEntries.length,
        itemBuilder: ((context, index) =>
            EntryTile(entry: filterdEntries[index])));
  }
}
