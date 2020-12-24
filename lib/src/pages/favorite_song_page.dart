import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/widgets.dart';

class FavoriteSongPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorite songs'),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(
                icon: Icon(Icons.tune),
                onPressed: () => Get.to(FavoriteSongFilterPage()))
          ],
        ),
        body: SongListView(
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
        ));
  }
}
