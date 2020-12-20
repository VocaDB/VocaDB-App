import 'package:flutter/material.dart';

import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget dispaly list of entries and group by entry type
class EntryListView extends StatelessWidget {
  final List<EntryModel> entries;

  const EntryListView({this.entries});

  List<Widget> _generateItems() {
    List<Widget> items = [];

    EntryList entryList = EntryList(this.entries);

    if (entryList.songs != null && entryList.songs.isNotEmpty) {
      items.add(ListTile(
        title: Text('Songs'),
      ));

      items.addAll(entryList.songs.map((e) => SongTile.fromEntry(e)));
    }

    if (entryList.artists != null && entryList.artists.isNotEmpty) {
      items.add(ListTile(
        title: Text('Artists'),
      ));

      items.addAll(entryList.artists.map((e) => ArtistTile.fromEntry(e)));
    }

    if (entryList.albums != null && entryList.albums.isNotEmpty) {
      items.add(ListTile(
        title: Text('Albums'),
      ));

      items.addAll(entryList.albums.map((e) => AlbumTile.fromEntry(e)));
    }

    if (entryList.tags != null && entryList.tags.isNotEmpty) {
      items.add(ListTile(
        title: Text('Tags'),
      ));

      List<EntryModel> es = entryList.tags.toList();

      List<TagModel> tagModelList =
          es.map((e) => TagModel.fromEntry(e)).toList();

      items.add(TagGroupView(tags: tagModelList));
    }

    if (entryList.releaseEvents != null && entryList.releaseEvents.isNotEmpty) {
      items.add(ListTile(
        title: Text('Events'),
      ));

      items.addAll(
          entryList.releaseEvents.map((e) => ReleaseEventTile.fromEntry(e)));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = _generateItems();
    return ListView.builder(
        itemCount: items.length, itemBuilder: (context, index) => items[index]);

    // return ListView(
    //   children: [
    //     ListTile(
    //       title: Text('Songs'),
    //     ),
    //     SongTile(
    //         name: 'spirit photo',
    //         artistName: 'Kirishima feat. Hatsune Miku',
    //         thumbUrl: 'https://i.ytimg.com/vi/6OAd30ljny8/default.jpg',
    //         songType: 'Original'),
    //     ListTile(
    //       title: Text('Artists'),
    //     ),
    //     ArtistTile(
    //       name: '初音ミク',
    //       imageUrl: 'https://static.vocadb.net/img/artist/mainThumb/1.png?v=23',
    //     ),
    //     ListTile(
    //       title: Text('Albums'),
    //     ),
    //     AlbumTile(
    //       name: 'Deep Reflection',
    //       artist: 'Clean Tears, S.C.X feat. 初音ミク',
    //       imageUrl:
    //           'https://static.vocadb.net/img/album/mainThumb/23864.jpg?v=10',
    //     ),
    //     ListTile(
    //       title: Text('Tags'),
    //     ),
    //     TagGroupView(tags: [
    //       TagModel(name: 'rock'),
    //       TagModel(name: 'metal'),
    //       TagModel(name: 'jazz'),
    //       TagModel(name: 'ballad'),
    //     ]),
    //     ListTile(
    //       title: Text('Events'),
    //     ),
    //     ReleaseEventTile(
    //       name: 'Magical mirai 2020',
    //       venueName: 'Home',
    //       imageUrl:
    //           'https://static.vocadb.net/img/releaseevent/mainOrig/1426.jpg?v=19',
    //       category: 'Contest',
    //       startDate: DateTime.parse("2017-02-03 00:00:00Z"),
    //       endDate: DateTime.parse("2017-04-03 00:00:00Z"),
    //     ),
    //     ReleaseEventTile(
    //       name: 'MAIKAs Birthday 2020',
    //       imageUrl:
    //           'https://static.vocadb.net/img/releaseeventseries/mainOrig/206.jpg?v=4',
    //       category: 'Anniversary',
    //       startDate: DateTime.parse("2020-12-18T00:00:00Z"),
    //     ),
    //   ],
    // );
  }
}
