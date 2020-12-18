import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// Home page is same as VocaDB  website. Home page display list of highlighted songs, Recently added albums, Random popular albums and upcoming events
class HomePage extends StatelessWidget {
  /// Content list
  final List<Widget> children = [
    Section(
      title: 'Highlight PVs',
      child: SongListView(
        scrollDirection: Axis.horizontal,
        songs: [
          SongModel(
              id: 307335,
              name: 'spirit photo',
              artistString: 'Kirishima feat. Hatsune Miku',
              thumbUrl: 'https://i.ytimg.com/vi/6OAd30ljny8/default.jpg',
              songType: 'Original'),
          SongModel(
              id: 307325,
              name: '天誅',
              artistString: 'Kashii Moimi feat. Kagamine Len',
              thumbUrl:
                  'https://nicovideo.cdn.nimg.jp/thumbnails/37974374/37974374.34231370',
              songType: 'Original'),
          SongModel(
              id: 307179,
              name: 'Running-stitch-Heartbeat',
              artistString: 'RuupaaP feat. Hatsune Miku',
              thumbUrl:
                  'https://nicovideo.cdn.nimg.jp/thumbnails/37971183/37971183.65149070',
              songType: 'Original'),
        ],
      ),
    ),
    Section(
      title: 'Recent or upcoming albums',
      child: SongPlaceholderListView(),
    ),
    Section(
      title: 'Random popular albums',
      child: SongPlaceholderListView(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VocaDB'),
      ),
      body: ListView.builder(
        itemCount: children.length,
        itemBuilder: (context, index) => children[index],
      ),
    );
  }
}
