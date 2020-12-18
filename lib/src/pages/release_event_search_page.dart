import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/pages.dart';

class ReleaseEventSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Events'), actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () => Get.to(ReleaseEventSearchFilterPage()))
        ]),
        body: Container(
          child: Text('Event search page no implement'),
        ));
  }
}
