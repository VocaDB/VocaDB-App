import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/widgets.dart';

class FavoriteArtistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Favorite artists'), actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.tune),
              onPressed: () => Get.to(FavoriteArtistFilterPage()))
        ]),
        body: ArtistListView(
          artists: [
            ArtistModel(id: 1, name: 'Miku'),
            ArtistModel(id: 2, name: 'Luka')
          ],
        ));
  }
}
