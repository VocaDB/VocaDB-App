import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/pages.dart';

class SongSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Songs'), actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () => Get.to(SongSearchFilterPage()))
        ]),
        body: Container(
          child: Text('Song search page no implement'),
        ));
  }
}
