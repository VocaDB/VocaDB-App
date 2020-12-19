import 'package:flutter/material.dart';

import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget dispaly list of entries and group by entry type
class EntryListView extends StatelessWidget {
  const EntryListView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Songs'),
        ),
        SongTile(
            name: 'spirit photo',
            artistName: 'Kirishima feat. Hatsune Miku',
            thumbUrl: 'https://i.ytimg.com/vi/6OAd30ljny8/default.jpg',
            songType: 'Original'),
        ListTile(
          title: Text('Artists'),
        ),
        ArtistTile(
          name: '初音ミク',
          imageUrl: 'https://static.vocadb.net/img/artist/mainThumb/1.png?v=23',
        ),
        ListTile(
          title: Text('Albums'),
        ),
        AlbumTile(
          name: 'Deep Reflection',
          artist: 'Clean Tears, S.C.X feat. 初音ミク',
          imageUrl:
              'https://static.vocadb.net/img/album/mainThumb/23864.jpg?v=10',
        ),
        ListTile(
          title: Text('Tags'),
        ),
        TagGroupView(tags: [
          TagModel(name: 'rock'),
          TagModel(name: 'metal'),
          TagModel(name: 'jazz'),
          TagModel(name: 'ballad'),
        ]),
        ListTile(
          title: Text('Events'),
        ),
        ReleaseEventTile(
          name: 'Magical mirai 2020',
          venueName: 'Home',
          imageUrl:
              'https://static.vocadb.net/img/releaseevent/mainOrig/1426.jpg?v=19',
          category: 'Contest',
          startDate: DateTime.parse("2017-02-03 00:00:00Z"),
          endDate: DateTime.parse("2017-04-03 00:00:00Z"),
        ),
        ReleaseEventTile(
          name: 'Magical mirai 2020',
          venueName: 'Home',
          imageUrl:
              'https://static.vocadb.net/img/releaseevent/mainOrig/1426.jpg?v=19',
          category: 'Contest',
          startDate: DateTime.parse("2017-02-03 00:00:00Z"),
          endDate: DateTime.parse("2017-04-03 00:00:00Z"),
        ),
      ],
    );
  }
}
