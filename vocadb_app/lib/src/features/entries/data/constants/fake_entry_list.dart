import 'package:vocadb_app/src/features/entries/domain/entry.dart';

final kFakeEntryList = [
  // Songs
  Entry(
      id: 1,
      entryType: EntryType.Song.name,
      name: 'Song 1',
      songType: 'Original',
      artistString: 'Artist 1'),
  Entry(
    id: 2,
    entryType: EntryType.Song.name,
    name: 'Song 2',
    songType: 'Original',
    artistString: 'Artist 2',
  ),

  // Artists
  Entry(
    id: 1,
    entryType: EntryType.Artist.name,
    name: 'Artist 1',
    artistType: 'Vocaloid',
  ),
  Entry(
    id: 2,
    entryType: EntryType.Artist.name,
    name: 'Artist 2',
    artistType: 'Producer',
  ),

  // Albums
  Entry(
    id: 1,
    entryType: EntryType.Album.name,
    name: 'Album 1',
    discType: 'Album',
  ),
  Entry(
    id: 2,
    entryType: EntryType.Album.name,
    name: 'Album 2',
    discType: 'Album',
  ),

  // Release events
  Entry(
    id: 1,
    entryType: EntryType.ReleaseEvent.name,
    name: 'ReleaseEvent 1',
    discType: 'Album',
  ),
  Entry(
    id: 2,
    entryType: EntryType.ReleaseEvent.name,
    name: 'ReleaseEvent 2',
    discType: 'Album',
  ),
];
