import 'package:flutter/material.dart';

class TagSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Tags'), actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ]),
        body: Container(
          child: Text('Tag search page no implement'),
        ));
  }
}
