import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/entries/domain/entry.dart';
import 'package:vocadb_app/src/features/entries/presentation/entry_tile/entry_tile.dart';

class EntriesSearchResult extends StatelessWidget {
  const EntriesSearchResult({super.key, required this.entries});

  final List<Entry> entries;

  @override
  Widget build(BuildContext context) {
    final songs = entries.songEntries;
    final artists = entries.artistEntries;
    final albums = entries.albumEntries;
    final releaseEvents = entries.releaseEventEntries;

    return ListView(
      children: [
        Visibility(
          visible: songs.isNotEmpty,
          child: Column(
            children: [
              const ListTile(
                title: Text('Songs'),
              ),
              ...songs.map((e) => EntryTile(entry: e)),
            ],
          ),
        ),
        Visibility(
          visible: artists.isNotEmpty,
          child: Column(
            children: [
              const ListTile(
                title: Text('Artists'),
              ),
              ...artists.map((e) => EntryTile(entry: e)),
            ],
          ),
        ),
        Visibility(
          visible: albums.isNotEmpty,
          child: Column(
            children: [
              const ListTile(
                title: Text('Albums'),
              ),
              ...albums.map((e) => EntryTile(entry: e)),
            ],
          ),
        ),
        Visibility(
          visible: releaseEvents.isNotEmpty,
          child: Column(
            children: [
              const ListTile(
                title: Text('Events'),
              ),
              ...releaseEvents.map((e) => EntryTile(entry: e)),
            ],
          ),
        ),
      ],
    );
  }
}
