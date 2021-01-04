import 'package:flutter/material.dart';

import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget dispaly list of entries and group by entry type
class EntryListView extends StatelessWidget {
  final List<EntryModel> entries;

  final Function(EntryModel) onSelect;

  const EntryListView({this.entries, this.onSelect});

  List<Widget> _generateItems() {
    List<Widget> items = [];

    EntryList entryList = EntryList(this.entries);

    if (entryList.songs != null && entryList.songs.isNotEmpty) {
      items.add(ListTile(
        title: Text('Songs'),
      ));

      items.addAll(entryList.songs.map((e) => SongTile.fromEntry(
            e,
            onTap: () => this.onSelect(e),
          )));
    }

    if (entryList.artists != null && entryList.artists.isNotEmpty) {
      items.add(ListTile(title: Text('Artists')));

      items.addAll(entryList.artists
          .map((e) => ArtistTile.fromEntry(e, onTap: () => this.onSelect(e))));
    }

    if (entryList.albums != null && entryList.albums.isNotEmpty) {
      items.add(ListTile(
        title: Text('Albums'),
      ));

      items.addAll(entryList.albums
          .map((e) => AlbumTile.fromEntry(e, onTap: () => this.onSelect(e))));
    }

    if (entryList.tags != null && entryList.tags.isNotEmpty) {
      items.add(ListTile(
        title: Text('Tags'),
      ));

      List<EntryModel> es = entryList.tags.toList();

      List<TagModel> tagModelList =
          es.map((e) => TagModel.fromEntry(e)).toList();

      items.add(TagGroupView(
        tags: tagModelList,
        onPressed: (tag) => this.onSelect(tag),
      ));
    }

    if (entryList.releaseEvents != null && entryList.releaseEvents.isNotEmpty) {
      items.add(ListTile(
        title: Text('Events'),
      ));

      items.addAll(entryList.releaseEvents.map(
          (e) => ReleaseEventTile.fromEntry(e, onTap: () => this.onSelect(e))));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = _generateItems();
    return ListView.builder(
        itemCount: items.length, itemBuilder: (context, index) => items[index]);
  }
}
