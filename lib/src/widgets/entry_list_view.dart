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
        SongTile(
            name: '天誅',
            artistName: 'Kashii Moimi feat. Kagamine Len',
            thumbUrl:
                'https://nicovideo.cdn.nimg.jp/thumbnails/37974374/37974374.34231370',
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
        AlbumTile(
          name: '花束と水葬',
          artist: 'ハチ feat. 初音ミク',
          imageUrl:
              'https://static.vocadb.net/img/album/mainThumb/204.jpg?v=14',
        ),
        ListTile(
          title: Text('Tags'),
        ),
        TagGroupView(onPressed: (t) => print(t), tags: [
          TagModel(name: 'rock'),
          TagModel(name: 'metal'),
          TagModel(name: 'jazz'),
          TagModel(name: 'ballad'),
        ])
      ],
    );
  }
}
