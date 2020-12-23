import 'package:flutter/material.dart';
import 'package:vocadb_app/widgets.dart';

class TagCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Tags'), actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ]),
        body: TagCategoryList(
          onSelectCategory: () => {},
        ));
  }
}
