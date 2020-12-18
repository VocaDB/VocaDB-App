import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// Home page is same as VocaDB  website. Home page display list of highlighted songs, Recently added albums, Random popular albums and upcoming events
class HomePage extends StatelessWidget {
  List<Widget> _generateMockChildren() {
    return [
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
        child: AlbumListView(
          scrollDirection: Axis.horizontal,
          albums: [
            AlbumModel(
                id: 9227,
                name: 'THIS IS VOCAROCK',
                artistString: '164, 203soundworks feat. various'),
            AlbumModel(
                id: 1590,
                name: 'Michno-sequence',
                artistString: 'かめりあ feat. 初音ミク, GUMI'),
            AlbumModel(
                id: 4986,
                name: '東京テディベア',
                artistString: 'Neru, おればななP feat. 鏡音リン Append (Sweet)'),
          ],
        ),
      ),
      Section(
        title: 'Random popular albums',
        child: AlbumListView(
          scrollDirection: Axis.horizontal,
          albums: [
            AlbumModel(
                id: 29432,
                name: 'Regret',
                artistString: 'Mwk, Wakuwaku Miwaku feat. 初音ミク'),
            AlbumModel(
                id: 29433, name: '#B.E.R5th', artistString: 'Various artists'),
            AlbumModel(
                id: 29412,
                name: 'NX FUTURE CORE',
                artistString: 'Various artists'),
          ],
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = _generateMockChildren();

    return Scaffold(
      body: ListView.builder(
        itemCount: children.length,
        itemBuilder: (context, index) => children[index],
      ),
    );
  }
}
