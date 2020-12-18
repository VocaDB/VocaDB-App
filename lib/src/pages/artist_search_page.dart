import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/pages.dart';

class ArtistSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Artists'), actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () => Get.to(ArtistSearchFilterPage()))
        ]),
        body: Container(
          child: Text('Artist search page no implement'),
        ));
  }
}
