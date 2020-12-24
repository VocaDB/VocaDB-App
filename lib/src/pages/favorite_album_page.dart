import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/widgets.dart';

class FavoriteAlbumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Collections'), actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.tune),
              onPressed: () => Get.to(FavoriteAlbumFilterPage()))
        ]),
        body: AlbumListView(
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
        ));
  }
}
