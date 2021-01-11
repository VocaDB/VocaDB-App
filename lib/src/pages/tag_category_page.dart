import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/routes.dart';
import 'package:vocadb_app/widgets.dart';

class TagCategoryPage extends StatelessWidget {
  void _onSelectCategory(String category) {
    Get.toNamed(Routes.TAGS, arguments: TagSearchArgs(category: category));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Tags'), actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search), onPressed: () => _onSelectCategory('')),
        ]),
        body: TagCategoryList(
          onSelectCategory: this._onSelectCategory,
        ));
  }
}
