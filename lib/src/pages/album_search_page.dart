import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/pages.dart';

class AlbumSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Albums'), actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () => Get.to(AlbumSearchFilterPage()))
        ]),
        body: Container(
          child: Text('Album search page no implement'),
        ));
  }
}
